//
//  EventsSignupResponse.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct EventsSignupResponse {
    
    public var eventSignups: [EventSignup]
    
}

extension EventsSignupResponse: Decodable {
    
    private enum EventsSignupResponseCodingKeys: String, CodingKey {
        case eventSignups = "_items"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EventsSignupResponseCodingKeys.self)
        
        self.eventSignups = try container.decode([EventSignup].self, forKey: .eventSignups)
    }
    
}
