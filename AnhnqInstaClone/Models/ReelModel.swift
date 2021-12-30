//
//  ReelModel.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 29/12/2021.
//

import AVKit
import Foundation

struct Reel: Identifiable {
    var id = UUID().uuidString
    var player: AVPlayer?
    var mediaFile: MediaFile
}
