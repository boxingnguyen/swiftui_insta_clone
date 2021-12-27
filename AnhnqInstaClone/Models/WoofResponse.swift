//
//  WoofResponse.swift
//  AnhnqInstaClone
//
//  Created by anhnq2 on 20/12/2021.
//

import Foundation
class WoofResponse: Decodable {
    var fileSizeBytes: Int?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case fileSizeBytes
        case url
    }
    
    init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        fileSizeBytes = try? container.decode(Int.self, forKey: .fileSizeBytes)
        url = try? container.decode(String.self, forKey: .url)
    }
}
