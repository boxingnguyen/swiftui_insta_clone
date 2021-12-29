//
//  CommonTextField.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 08/12/2021.
//

import SwiftUI

struct CommonTextFieldView: View {
    @Binding var value: String
    var hint: String = ""
    var errMsg: String = ""
    var isSecure = false

    var body: some View {
        VStack(alignment: .leading) {
            if isSecure {
                SecureField("", text: $value)
                    .placeholder(hint, when: value.isEmpty)
                    .textFieldStyle(CommonTextFieldStyle())
            } else {
                TextField("", text: $value)
                    .placeholder(hint, when: value.isEmpty)
                    .textFieldStyle(CommonTextFieldStyle())
            }
            Text(errMsg)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
                .foregroundColor(.red)
        }
    }
}

struct CommonTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CommonTextFieldView(value: .constant(""), hint: "abc").background(.blue)
    }
}
