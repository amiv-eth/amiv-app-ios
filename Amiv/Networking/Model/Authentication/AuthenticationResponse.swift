//
//  AuthenticationResponse.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 08.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct AuthenticationResponse {
    
    public var token: String
    public var id: String
    
}

extension AuthenticationResponse: Decodable {
    
    private enum AuthenticationResponseCodingKeys: String, CodingKey {
        case token = "token"
        case id = "_id"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AuthenticationResponseCodingKeys.self)
        
        self.token = try container.decode(String.self, forKey: .token)
        self.id = try container.decode(String.self, forKey: .id)
    }
    
}
