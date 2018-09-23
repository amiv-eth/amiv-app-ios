//
//  NetworkError.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public enum NetworkError: String, Error {
    
    case missingParameters = "Parameter were missing."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL was missing."
    
}
