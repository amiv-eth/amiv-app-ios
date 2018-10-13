//
//  KeychainKey.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public enum KeychainKey: String {
    
    case username
    case password
    case authToken
    case userID
    
}

extension KeychainKey {
    
    /// Gets associated value of key from keychain store
    public func getString() -> String? {
        let keychain = KeychainSwift()
        let string = keychain.get(self.rawValue)
        
        return string
    }
    
}
