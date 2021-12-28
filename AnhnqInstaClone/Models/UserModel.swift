//
//  UserModel.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 27/12/2021.
//

import Foundation

struct User: Encodable, Decodable {
    var id: String
    var email: String
    var profileImgUrl: String
    var username: String
    var bio: String
}
