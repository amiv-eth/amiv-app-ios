//
//  AMIVApi.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public enum AMIVApi {
    
    case jobs
    case events
    
}

extension AMIVApi: EndPointType {
    
    public var baseURL: URL {
        return URL(string: "https://api.amiv.ethz.ch/")!
    }
    
    public var path: String {
        switch self {
        case .events:
            return "events"
        case .jobs:
            return "joboffers"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .events, .jobs:
            return .get
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .events, .jobs:
            return .request
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .events, .jobs:
            return nil
        }
    }
    
}
