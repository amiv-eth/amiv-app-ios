//
//  RouterError.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 08.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public enum RouterError: String, Error {
    
    case missingAuthToken = "Authentication token is missing."
    case badAuthenticationData = "Authentication data was badly created."
    
}
