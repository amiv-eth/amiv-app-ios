//
//  AMIVApiStudyDocuments.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 10.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public enum AMIVApiStudyDocuments {
    
    case overview
    
}

extension AMIVApiStudyDocuments: EndPointType {
    
    public var path: String {
        switch self {
        case .overview:
            return "studydocuments"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .overview:
            return .get
        }
    }
    
    public var task: HTTPTask {
        switch self {
        case .overview:
            return .request
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .overview:
            return nil
        }
    }
    
    public var isAuthenticationRequired: Bool {
        switch self {
        case .overview:
            return true
        }
    }
    
}
