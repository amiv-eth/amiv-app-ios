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
    case logout
    
}

extension AMIVApiSession {
    
    public var path: String {
        switch self {
        case .authenticate:
            return "/sessions"
        case .logout:
            let keychain = KeychainSwift()
            guard let id = keychain.get(KeychainKey.sessionID.rawValue) else {
                return "/sessions"
            }
            return "/sessions/\(id)"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .authenticate:
            return .post
        case .logout:
            return .delete
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case let .authenticate(username: username, password: password):
            let parameters = ["username": username, "password": password]
            return .requestParameters(bodyParameters: parameters, urlParameter: nil)
        case .logout:
            return .request
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .authenticate, .logout:
            return nil
        }
    }
    
    public var isAuthenticationRequired: Bool {
        switch self {
        case .authenticate:
            return false
        case .logout:
            return true
        }
    }
    
}
