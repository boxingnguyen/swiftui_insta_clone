//
//  ViewExtension.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 13/12/2021.
//

import SwiftUI

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
        placeholder(when: shouldShow, alignment: alignment) { Text(text).foregroundColor(.white).padding(7) }
    }
}
