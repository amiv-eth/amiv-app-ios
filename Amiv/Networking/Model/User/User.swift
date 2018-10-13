//
//  User.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct User {
    
    public var nethz: String
    
}

extension User: Decodable {
    
    private enum UserCodingKeys: String, CodingKey {
        case nethz = "nethz"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UserCodingKeys.self)
        
        self.nethz = try container.decode(String.self, forKey: .nethz)
    }
    
}
