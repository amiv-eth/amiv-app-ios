//
//  AmivRootNavigator.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class AmivRootNavigator: RootNavigator {
    
    // MARK: - Variables
    
    public var window: UIWindow
    
    public var currentNavigator: Navigator?
    
    // MARK: - Initializers
    
    public init(window: UIWindow) {
        self.window = window
        
        self.goToApp()
    }
    
    // MARK: - Navigation
    
    private func goToApp() {
        let app = AppNavigator()
        self.window.rootViewController = app.rootViewController
        self.currentNavigator = app
    }
    
    private func goToOnboarding() {
        
    }
    
}
