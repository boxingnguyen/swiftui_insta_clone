//
//  ViewExtension.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 13/12/2021.
//

import SwiftUI

// MARK: View extension

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View
    {
        ZStack(alignment: alignment) {
            if shouldShow {
                placeholder()
            } else {
                EmptyView()
            }
            self
        }
    }
}

extension View {
    func placeholder(
        _ text: String,
        when shouldShow: Bool,
        alignment: Alignment = .leading) -> some View
    {
        placeholder(when: shouldShow, alignment: alignment) {
            Text(text)
                .padding(7)
                .foregroundColor(.white)
                .font(.body)
        }
    }
}

// MARK: Color extension

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
