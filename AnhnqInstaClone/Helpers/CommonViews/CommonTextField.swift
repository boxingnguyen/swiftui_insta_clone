//
//  CommonTextField.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 08/12/2021.
//

import SwiftUI

struct CommonTextField: View {
    var hint: String = ""
    var isSecure = false
    @State var value = ""

    var body: some View {
        if isSecure {
            SecureField("", text: $value)
                .placeholder(hint, when: value.isEmpty)
                .textFieldStyle(CommonTextFieldStyle())

        } else {
            TextField("", text: $value)
                .placeholder(hint, when: value.isEmpty)
                .textFieldStyle(CommonTextFieldStyle())
        }
    }

//    func placeholder(
//        _ text: String,
//        when shouldShow: Bool,
//        alignment: Alignment = .leading) -> some View
//    {
//        placeholder(when: shouldShow, alignment: alignment) { Text(text).foregroundColor(.white).padding(7) }
//    }
}

struct CommonTextField_Previews: PreviewProvider {
    static var previews: some View {
        CommonTextField()
    }
}
