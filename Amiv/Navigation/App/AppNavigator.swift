//
//  AppNavigator.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class AppNavigator: Navigator {
    
    // MARK: - Variables
    
    private var childNavigators: [Navigator] = []
    
    public var rootViewController: UIViewController {
        return tabBarController
    }
    
    private var tabBarController: UITabBarController
    
    // MARK: - Tabs
    
    private enum Tab: Int {
        case home
        case apps
    }
    
    // MARK: - Initializers
    
    public init() {
        self.tabBarController = UITabBarController()
        
        self.createTabs()
    }
    
    // MARK: - Tab Bar Tabs
    
    private func createTabs() {
        // Create all tabs
        self.createHomeTab()
        self.createAmivApplicationTab()
        self.createSettingsTab()
        
        // Make tabBarController ready
        self.tabBarController.viewControllers = self.childNavigators.map({ $0.rootViewController })
        self.tabBarController.selectedIndex = Tab.home.rawValue
        self.tabBarController.tabBar.tintColor = .amivRed
    }
    
    private func createHomeTab() {
        let home = HomeNavigator()
        self.childNavigators.append(home)
    }
    
    private func createAmivApplicationTab() {
        let app = AmivApplicationsNavigator()
        self.childNavigators.append(app)
    }
    
    private func createSettingsTab() {
        let settings = SettingsNavigator()
        self.childNavigators.append(settings)
    }
    
}
