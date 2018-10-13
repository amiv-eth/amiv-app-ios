//
//  SessionManager.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public class SessionManager {
    
    /// Authentication Token for current session
    public static var authToken: String? {
        let keychain = KeychainSwift()
        return keychain.get(KeychainKey.authToken.rawValue)
    }
    
    public static var userID: String? {
        let keychain = KeychainSwift()
        return keychain.get(KeychainKey.userID.rawValue)
    }
    
    /// Bool indicating if user is currently logged in
    public static var isLoggedIn: Bool {
        return SessionManager.authToken != nil
    }
    
    /// Destroys authentication token and session id from keychain store
    public static func logout() {
        let keychain = KeychainSwift()
        keychain.delete(KeychainKey.authToken.rawValue)
        keychain.delete(KeychainKey.userID.rawValue)
    }
    
    public static func save(_ session: AuthenticationResponse) {
        let keychain = KeychainSwift()
        keychain.set(session.token, forKey: KeychainKey.authToken.rawValue)
        keychain.set(session.userID, forKey: KeychainKey.userID.rawValue)
        keychain.synchronizable = true
    }
    
}
