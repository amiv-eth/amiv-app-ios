//
//  AmivMicroAppCheckin.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 26.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class AmivMicroAppCheckin: AmivMicroApp {
    
    // MARK: - Variables
    
    public var delegate: AmivMicroAppDelegate
    
    public var rootViewController: UIViewController {
        return checkinController
    }
    
    private lazy var checkinController: UIViewController = {
        let con = LoginViewController(model: LoginModel.createNormal())
        con.delegate = self
        return con
    }()
    
    // MARK: - Initializers
    
    public init(delegate: AmivMicroAppDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - App lifetime
    
    public func start() -> Bool {
        return true
    }
}

extension AmivMicroAppCheckin: LoginViewControllerDelegate {
    
    public func login(_ viewController: LoginViewController, username: String, password: String) {
        self.delegate.appIsFinished()
    }
    
    public func smallButtonTapped(_ viewController: LoginViewController) {
        self.delegate.appIsFinished()
    }
    
}
