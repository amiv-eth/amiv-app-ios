//
//  EventItem.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct EventItem {
    
    public let title: String
    public let catchPhrase: String
    public let location: String
    public let startTime: Date
    public let endTime: Date
    public let description: String
    
    
}

extension EventItem: Decodable {
    
    private enum EventItemResponseCodingKeys: String, CodingKey {
        case title = "title_en"
        case catchPhrase = "catchphrase_en"
        case location = "location"
        case startTime = "time_start"
        case endTime = "time_end"
        case description = "description_en"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EventItemResponseCodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.catchPhrase = try container.decode(String.self, forKey: .catchPhrase)
        self.location = try container.decode(String.self, forKey: .location)
        
        if let startTime = try container.decode(String.self, forKey: .startTime).toDate() {
            self.startTime = startTime
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [EventItemResponseCodingKeys.startTime], debugDescription: "Invalid date string"))
        }
        
        if let endTime = try container.decode(String.self, forKey: .endTime).toDate() {
            self.endTime = endTime
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [EventItemResponseCodingKeys.endTime], debugDescription: "Invalid date string"))
        }
        
        self.description = try container.decode(String.self, forKey: .description)
    }
    
}