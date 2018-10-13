//
//  AMIVApiUser.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public enum AMIVApiUser {
    
    case userInfo
    
}

extension AMIVApiUser: EndPointType {
    
    public var path: String {
        switch self {
        case .userInfo:
            let keychain = KeychainSwift()
            guard let id = keychain.get(KeychainKey.sessionID.rawValue) else {
                return "/users"
            }
            return "/users/\(id)"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .userInfo:
            return .get
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .userInfo:
            return .request
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .userInfo:
            return nil
        }
    }
    
    public var isAuthenticationRequired: Bool {
        switch self {
        case .userInfo:
            return true
        }
    }
    
    
    
    
}
