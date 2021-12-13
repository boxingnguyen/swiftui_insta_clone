//
//  CommonTextFieldStyle.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 13/12/2021.
//

import SwiftUI

struct CommonTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(7)
            .foregroundColor(.white)
            .background(
                .white.opacity(0.2)
                // border
//                RoundedRectangle(cornerRadius: 20, style: .continuous)
//                    .stroke(Color.red, lineWidth: 3)
            )
    }
}
