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
    case allEventSignups
    case signup(_ event: String, user: String)
    case media(_ path: String)
    
}

extension AMIVApiEvents: EndPointType {
    
    public var path: String {
        switch self {
        case .events:
            return "/events"
        case .allEventSignups, .signup:
            return "/eventsignups"
        case .media(let path):
            return path
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .events, .media, .allEventSignups:
            return .get
        case .signup:
            return .post
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .events, .media, .allEventSignups:
            return .request
        case let .signup(event, user):
            let parameters = ["event": event, "user": user]
            return .requestParameters(bodyParameters: parameters, urlParameter: nil)
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .events, .media, .allEventSignups, .signup:
            return nil
        }
    }
    
    public var isAuthenticationRequired: Bool {
        switch self {
        case .events, .media:
            return false
        case .allEventSignups, .signup:
            return true
        }
    }
    
}
