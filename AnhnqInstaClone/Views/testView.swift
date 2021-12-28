//
//  testView.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 15/12/2021.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        StyledText(verbatim: "👩‍👩‍👦someText1 gibberish gibberish gibberish")
            .style(.highlight(), ranges: { [$0.range(of: "eTex"), $0.range(of: "1"), $0.range(of: "gibberish")] })
            .style(.bold())
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

// An internal convenience extension that could be defined outside this pacakge.
// This wouldn't be a general-purpose way to highlight, but shows how a caller could create
// their own extensions
extension TextStyle {
    static func highlight() -> TextStyle { .foregroundColor(.red) }
}
