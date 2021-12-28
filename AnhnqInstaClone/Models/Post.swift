//
//  Post.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 28/12/2021.
//

import Foundation

struct Post {
    var owner: User
    var content: [String] // image or video url
    var caption: String
    var isFavorite: Bool
}
