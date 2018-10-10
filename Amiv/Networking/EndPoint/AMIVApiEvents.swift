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
    
}

extension AMIVApiEvents: EndPointType {
    
    public var path: String {
        switch self {
        case .events:
            return "events"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .events:
            return .get
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .events:
            return .request
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .events:
            return nil
        }
    }
    
    public var isAuthenticationRequired: Bool {
        switch self {
        case .events:
            return false
        }
    }
    
}
