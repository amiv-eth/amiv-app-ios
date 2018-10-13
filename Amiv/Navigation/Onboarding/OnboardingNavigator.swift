//
//  OnboardingNavigator.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class OnboardingNavigator: Navigator {
    
    // MARK: - Variables
    
    let networkManager = NetworkManager<AMIVApiSession>()
    
    public var delegate: OnboardingNavigatorDelegate?
    
    public var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    public init() {
        let info = InfoViewController(model: .create())
        self.navigationController = UINavigationController(rootViewController: info)
        info.delegate = self
    }
    
    // MARK: - Navigation
    
    private func presentLogin() {
        let login = LoginViewController(model: .createOnboarding())
        login.delegate = self
        self.navigationController.present(login, animated: true, completion: nil)
    }
    
}

extension OnboardingNavigator: InfoViewControllerDelegate {
    
    public func buttonPressed() {
        self.presentLogin()
    }
    
    public func smallButtonPressed() {
        self.delegate?.onboardingFinished()
    }
    
}

extension OnboardingNavigator: LoginViewControllerDelegate {
    
    public func login(_ viewController: LoginViewController, username: String, password: String) {
        // TODO: - Check for valid credentials
        debugPrint("Logging in with username: \(username) and password: \(password)")
        
        
        self.networkManager.authenticate(username: username, password: password) { (response, error) in
            guard let response = response else {
                DispatchQueue.main.async {
                    viewController.loginFailed(with: "Incorrect Username or Password.\nPlease try again.")
                }
                return
            }
            
            // Save token into secure and encrypted keychain
            SessionManager.save(response)
            
            DispatchQueue.main.async {
                self.delegate?.onboardingFinished()
            }
        }
    }
    
    public func smallButtonTapped(_ viewController: LoginViewController) {
        self.delegate?.onboardingFinished()
    }
    
}
