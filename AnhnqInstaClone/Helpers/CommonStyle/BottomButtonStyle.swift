//
//  BottomButton.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 08/12/2021.
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
