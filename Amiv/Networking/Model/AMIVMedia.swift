//
//  AMIVMedia.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 12.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct AMIVMedia {
    
    var type: AMIVMediaType
    
    var filePath: String
    var name: String
    var length: Int
    var dateUploaded: Date
    
}

extension AMIVMedia: Decodable {
    
    private enum AMIVMediaCodingKeys: String, CodingKey {
        
        case type = "content_type"
        case filePath = "file"
        case name = "name"
        case length = "length"
        case dateUploaded = "upload_date"
        
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AMIVMediaCodingKeys.self)
        
        let type = try container.decode(String.self, forKey: .type)
        
        switch type {
        case "application/pdf":
            self.type = .pdf
        case "image/png", "image/jpg", "image/jpeg":
            self.type = .image
        default:
            self.type = .unknown
        }
        
        self.filePath = try container.decode(String.self, forKey: .filePath)
        self.name = try container.decode(String.self, forKey: .name)
        self.length = try container.decode(Int.self, forKey: .length)
        if let dateUploaded = try container.decode(String.self, forKey: .dateUploaded).toDate() {
            self.dateUploaded = dateUploaded
        } else {
            self.dateUploaded = Date()
        }
    }
    
}
