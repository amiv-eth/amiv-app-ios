//
//  UsersResponse.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct UsersResponse {
    
    var users: [User]
    
}

extension UsersResponse: Decodable {
    
    private enum UsersResponseCodingKeys: String, CodingKey {
        case users = "_items"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UsersResponseCodingKeys.self)
        
        self.users = try container.decode([User].self, forKey: .users)
    }
    
}
