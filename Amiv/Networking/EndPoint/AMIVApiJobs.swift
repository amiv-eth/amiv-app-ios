//
//  AMIVApiJobs.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 10.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public enum AMIVApiJobs: EndPointType {
    
    case jobs
    case media(_ path: String)
    
}

extension AMIVApiJobs {
    
    public var path: String {
        switch self {
        case .jobs:
            return "/joboffers"
        case .media(let path):
            return path
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .jobs, .media:
            return .get
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .jobs, .media:
            return .request
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .jobs, .media:
            return nil
        }
    }
    
    public var isAuthenticationRequired: Bool {
        return true
    }
    
}
