//
//  EventSignup.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct EventSignup {
    
    public var event: String
    public var user: String
    public var email: String
    public var isConfirmed: Bool
    public var isAccepted: Bool
    public var id: String
    
}

extension EventSignup: Decodable {
    
    private enum EventSignupCodingKeys: String, CodingKey {
        case event = "event"
        case user = "user"
        case email = "email"
        case isConfirmed = "confirmed"
        case isAccepted = "accepted"
        case id = "_id"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EventSignupCodingKeys.self)
        
        self.event = try container.decode(String.self, forKey: .event)
        self.user = try container.decode(String.self, forKey: .user)
        self.email = try container.decode(String.self, forKey: .email)
        self.isConfirmed = try container.decode(Bool.self, forKey: .isConfirmed)
        self.isAccepted = try container.decode(Bool.self, forKey: .isAccepted)
        self.id = try container.decode(String.self, forKey: .id)
    }
    
}
