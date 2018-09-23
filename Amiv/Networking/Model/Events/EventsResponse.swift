//
//  EventsResponse.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct EventsResponse {
    
    public let events: [EventItem]
    
}

extension EventsResponse: Decodable {
    
    private enum EventsResponseCodingKeys: String, CodingKey {
        case events = "_items"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EventsResponseCodingKeys.self)
        
        self.events = try container.decode([EventItem].self, forKey: .events)
    }
    
}
