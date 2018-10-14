//
//  JSONEncoder+Extension.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

extension Encodable {
    
    public func encode() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
}
