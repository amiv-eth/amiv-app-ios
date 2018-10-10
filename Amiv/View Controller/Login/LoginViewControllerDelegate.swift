//
//  LoginViewControllerDelegate.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public protocol LoginViewControllerDelegate {
    
    func login(_ viewController: LoginViewController, username: String, password: String)
    
    func smallButtonTapped(_ viewController: LoginViewController)
    
}
