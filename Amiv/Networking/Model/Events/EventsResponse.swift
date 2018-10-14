//
//  EventsResponse.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct EventsResponse {
    
    public let events: [AMIVEvent]
    
}

extension EventsResponse: Decodable {
    
    private enum EventsSignupResponseCodingKeys: String, CodingKey {
        case events = "_items"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EventsSignupResponseCodingKeys.self)
        
        self.events = try container.decode([AMIVEvent].self, forKey: .events)
    }
    
}

extension EventsResponse {
    
    public func sortEvents() -> [(String, [AMIVEvent])] {
        var past: [AMIVEvent] = []
        var today: [AMIVEvent] = []
        var upcoming: [AMIVEvent] = []
        var current: [AMIVEvent] = []
        let now = Date()
        
        self.events.forEach { (event) in
            if event.startTime <= now && event.endTime >= now {
                current.append(event)
            } else if event.startTime.isToday {
                today.append(event)
            } else if event.startTime >= now {
                upcoming.append(event)
            } else if event.endTime <= now {
                past.append(event)
            }
        }
        let events: [(String, [AMIVEvent])] = [("Right Now", current), ("Today", today), ("Upcoming", upcoming), ("Past Events", past)]
        return events.filter({!($0.1.isEmpty)})
    }
    
}
