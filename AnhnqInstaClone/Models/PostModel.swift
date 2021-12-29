//
//  Post.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 28/12/2021.
//

import Foundation

struct PostModel {
    var owner: UserModel
    var content: [String] // image or video url
    var caption: String
    var isFavorite: Bool
}
