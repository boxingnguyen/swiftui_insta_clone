//
//  Constants.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 14/12/2021.
//

import Foundation

class Constants {
    static let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")

    // Minimum 8 characters at least 1 Alphabet and 1 Number:
    static let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")
    static let maxLength = 64
}
