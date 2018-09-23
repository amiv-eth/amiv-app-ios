//
//  HTTPTask.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String: String]

public enum HTTPTask {
    
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameter: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameter: Parameters?, additionalHeaders: HTTPHeaders?)
    
}
