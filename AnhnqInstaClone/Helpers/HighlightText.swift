//
//  HighlightText.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 29/12/2021.
//
// original gist from https://gist.github.com/rnapier/a37cdbf4aabb1e4a6b40436efc2c3114
// Thank to rnapier & cci-rmirza

import SwiftUI

public struct TextStyle {
    // This type is opaque because it exposes NSAttributedString details and requires unique keys.
    // It can be extended, however, by using public static methods.
    // Properties are internal to be accessed by StyledText
    internal let key: NSAttributedString.Key
    internal let apply: (Text) -> Text
    private init(key: NSAttributedString.Key, apply: @escaping (Text) -> Text) {
        self.key = key
        self.apply = apply
    }
}

// Public methods for building styles
public extension TextStyle {
    static func foregroundColor(_ color: Color) -> TextStyle {
        TextStyle(key: .init("TextStyleForegroundColor"), apply: { $0.foregroundColor(color) })
    }

    static func bold() -> TextStyle {
        TextStyle(key: .init("TextStyleBold"), apply: { $0.bold() })
    }
}

public struct StyledText {
    // This is a value type. Don't be tempted to use NSMutableAttributedString here unless
    // you also implement copy-on-write.
    private var attributedString: NSAttributedString

    private init(attributedString: NSAttributedString) {
        self.attributedString = attributedString
    }

    public func style<S>(_ style: TextStyle,
                         ranges: (String) -> S) -> StyledText
        where S: Sequence, S.Element == Range<String.Index>?
    {
        // Remember this is a value type. If you want to avoid this copy,
        // then you need to implement copy-on-write.
        let newAttributedString = NSMutableAttributedString(attributedString: attributedString)

        for range in ranges(attributedString.string).compactMap({ $0 }) {
            let nsRange = NSRange(range, in: attributedString.string)
            newAttributedString.addAttribute(style.key, value: style, range: nsRange)
        }

        return StyledText(attributedString: newAttributedString)
    }
}

public extension StyledText {
    // A convenience extension to apply to a single range.
    func style(_ style: TextStyle,
               range: (String) -> Range<String.Index> = { $0.startIndex ..< $0.endIndex }) -> StyledText
    {
        self.style(style, ranges: { [range($0)] })
    }
}

public extension StyledText {
    init(verbatim content: String, styles: [TextStyle] = []) {
        let attributes = styles.reduce(into: [:]) { result, style in
            result[style.key] = style
        }
        attributedString = NSMutableAttributedString(string: content, attributes: attributes)
    }
}

extension StyledText: View {
    public var body: some View { text() }

    public func text() -> Text {
        var text = Text(verbatim: "")
        attributedString
            .enumerateAttributes(in: NSRange(location: 0, length: attributedString.length),
                                 options: []) { attributes, range, _ in
                let string = attributedString.attributedSubstring(from: range).string
                let modifiers = attributes.values.map { $0 as! TextStyle }
                text = text + modifiers.reduce(Text(verbatim: string)) { segment, style in
                    style.apply(segment)
                }
            }
        return text
    }
}
