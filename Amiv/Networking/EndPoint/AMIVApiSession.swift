//
//  AMIVApiSession.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 08.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public enum AMIVApiSession: EndPointType {
    
    case authenticate(username: String, password: String)
    
}

extension AMIVApiSession {
    
    public var path: String {
        return "sessions"
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .authenticate:
            return .post
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case let .authenticate(username: username, password: password):
            let parameters = ["username": username, "password": password]
            return .requestParameters(bodyParameters: parameters, urlParameter: nil)
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .authenticate:
            return nil
        }
    }
    
    public var isAuthenticationRequired: Bool {
        switch self {
        case .authenticate:
            return false
        }
    }
    
}
