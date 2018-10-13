//
//  EndPointType.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public protocol EndPointType {
    
    // MARK: - Variables
    
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    var isAuthenticationRequired: Bool { get }
    
}

extension EndPointType {
    
    public var baseURL: URL {
        return URL(string: "https://api-dev.amiv.ethz.ch/")!
    }
    
}
