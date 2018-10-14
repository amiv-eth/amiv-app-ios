//
//  SessionManager.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public class SessionManager {
    
    private static var networkManager = NetworkManager<AMIVApiSession>()
    
    /// Authentication Token for current session
    public static var authToken: String? {
        let keychain = KeychainSwift()
        return keychain.get(KeychainKey.authToken.rawValue)
    }
    
    public static var userID: String? {
        let keychain = KeychainSwift()
        return keychain.get(KeychainKey.userID.rawValue)
    }
    
    public static var sessionID: String? {
        let keychain = KeychainSwift()
        return keychain.get(KeychainKey.sessionID.rawValue)
    }
    
    public static var etag: String? {
        let keychain = KeychainSwift()
        return keychain.get(KeychainKey.etag.rawValue)
    }
    
    /// Bool indicating if user is currently logged in
    public static var isLoggedIn: Bool {
        return SessionManager.authToken != nil
    }
    
    /// Destroys authentication token and session id from keychain store
    public static func logout(_ completion: @escaping (_ success: Bool, _ error: String?) -> Void) {
        SessionManager.networkManager.logout { (success, error) in
            if success {
                SessionManager.delete()
                completion(success, error)
            } else {
                completion(success, error)
            }
        }
    }
    
    public static func login(username: String, password: String, _ completion: @escaping (_ success: Bool, _ error: String?) -> Void) {
        SessionManager.networkManager.authenticate(username: username, password: password) { (response, error) in
            guard error == nil, let response = response else {
                completion(false, error)
                return
            }
            
            SessionManager.save(response)
            
            let userManager = NetworkManager<AMIVApiUser>()
            userManager.getUserInfo(userID: response.userID, { (user, error) in
                guard error == nil, let user = user else {
                    completion(false, "Error getting user info.")
                    return
                }
                if user.save {
                    completion(true, nil)
                } else {
                    completion(false, "Error storing user locally.")
                }
            })
        }
    }
    
    public static func save(_ session: AuthenticationResponse) {
        let keychain = KeychainSwift()
        keychain.set(session.token, forKey: KeychainKey.authToken.rawValue)
        keychain.set(session.userID, forKey: KeychainKey.userID.rawValue)
        keychain.set(session.sessionId, forKey: KeychainKey.sessionID.rawValue)
        keychain.set(session.etag, forKey: KeychainKey.etag.rawValue)
        keychain.synchronizable = true
    }
    
    public static func delete() {
        let keychain = KeychainSwift()
        keychain.delete(KeychainKey.authToken.rawValue)
        keychain.delete(KeychainKey.userID.rawValue)
        keychain.delete(KeychainKey.sessionID.rawValue)
        keychain.delete(KeychainKey.etag.rawValue)
        keychain.synchronizable = true
    }
    
}
