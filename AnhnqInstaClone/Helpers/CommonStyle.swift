//
//  CommonTextFieldStyle.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 13/12/2021.
//

import SwiftUI

struct BottomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 40)
            .cornerRadius(5)
            .background(Color(hex: 0x5b56f0))
    }
}

struct CommonTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(7)
            .font(.body)
            .foregroundColor(.white)
            .autocapitalization(.none)
            .background(
                .white.opacity(0.2)
                // border
//                RoundedRectangle(cornerRadius: 20, style: .continuous)
//                    .stroke(Color.red, lineWidth: 3)
            )
    }
}
