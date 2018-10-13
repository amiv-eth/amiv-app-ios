//
//  EventSignup.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct EventSignup {
    
    public var eventID: String
    public var userID: String?
    public var email: String
    public var isConfirmed: Bool
    public var isAccepted: Bool
    public var signupID: String
    public var etag: String
    
}

extension EventSignup: Codable {
    
    private enum EventSignupCodingKeys: String, CodingKey {
        case eventID = "event"
        case userID = "user"
        case email = "email"
        case isConfirmed = "confirmed"
        case isAccepted = "accepted"
        case signupID = "_id"
        case etag = "_etag"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EventSignupCodingKeys.self)
        
        self.eventID = try container.decode(String.self, forKey: .eventID)
        self.userID = try? container.decode(String.self, forKey: .userID)
        self.email = try container.decode(String.self, forKey: .email)
        self.isConfirmed = try container.decode(Bool.self, forKey: .isConfirmed)
        self.isAccepted = try container.decode(Bool.self, forKey: .isAccepted)
        self.signupID = try container.decode(String.self, forKey: .signupID)
        self.etag = try container.decode(String.self, forKey: .etag)
    }
    
    // TODO: - Implement encodable
}
