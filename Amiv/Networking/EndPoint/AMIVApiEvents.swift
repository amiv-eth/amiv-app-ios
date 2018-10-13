//
//  AMIVApiEvents.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public enum AMIVApiEvents {
    
    case events
    case media(_ path: String)
    
}

extension AMIVApiEvents: EndPointType {
    
    public var path: String {
        switch self {
        case .events:
            return "/events"
        case .media(let path):
            return path
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .events, .media:
            return .get
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .events, .media:
            return .request
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .events, .media:
            return nil
        }
    }
    
    public var isAuthenticationRequired: Bool {
        switch self {
        case .events, .media:
            return false
        }
    }
    
}
