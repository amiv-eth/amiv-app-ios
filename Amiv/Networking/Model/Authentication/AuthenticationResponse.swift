//
//  AuthenticationResponse.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 08.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct AuthenticationResponse {
    
    public var userID: String
    public var token: String
    public var sessionId: String
    public var etag: String
    
}

extension AuthenticationResponse: Decodable {
    
    private enum AuthenticationResponseCodingKeys: String, CodingKey {
        case userID = "user"
        case token = "token"
        case sessionId = "_id"
        case etag = "_etag"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AuthenticationResponseCodingKeys.self)
        
        self.userID = try container.decode(String.self, forKey: .userID)
        self.token = try container.decode(String.self, forKey: .token)
        self.sessionId = try container.decode(String.self, forKey: .sessionId)
        self.etag = try container.decode(String.self, forKey: .etag)
    }
    
}
