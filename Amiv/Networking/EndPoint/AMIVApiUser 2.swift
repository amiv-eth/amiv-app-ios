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
    case allUsers
    
}

extension AMIVApiUser: EndPointType {
    
    public var path: String {
        switch self {
        case .userInfo:
            if let id = SessionManager.userID {
                return "/users/\(id)"
            }
            return "/users/0"
        case .allUsers:
            return "/users"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .userInfo, .allUsers:
            return .get
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .userInfo, .allUsers:
            return .request
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .userInfo, .allUsers:
            return nil
        }
    }
    
    public var isAuthenticationRequired: Bool {
        switch self {
        case .userInfo, .allUsers:
            return true
        }
    }
    
}
