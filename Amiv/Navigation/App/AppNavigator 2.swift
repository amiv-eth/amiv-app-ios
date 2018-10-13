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
        //case home
        case events
        case jobs
        case apps
        case settings
    }
    
    // MARK: - Initializers
    
    public init() {
        self.tabBarController = UITabBarController()
        
        self.createTabs()
    }
    
    // MARK: - Tab Bar Tabs
    
    private func createTabs() {
        // Create all tabs
        //self.createHomeTab()
        self.createEventsTab()
        self.createJobsTab()
        self.createAmivApplicationTab()
        self.createSettingsTab()
        
        // Make tabBarController ready
        self.tabBarController.viewControllers = self.childNavigators.map({ $0.rootViewController })
        self.tabBarController.selectedIndex = Tab.events.rawValue
        self.tabBarController.tabBar.tintColor = .amivRed
    }
    
    private func createHomeTab() {
        let home = HomeNavigator()
        self.childNavigators.append(home)
    }
    
    private func createEventsTab() {
        let events = EventsNavigator()
        self.childNavigators.append(events)
    }
    
    private func createJobsTab() {
        let jobs = JobsNavigator()
        self.childNavigators.append(jobs)
    }
    
    private func createAmivApplicationTab() {
        let app = AmivMicroAppsNavigator()
        app.rootViewController.tabBarItem = UITabBarItem(title: "Apps", image: UIImage(named: "appsTab"), tag: Tab.settings.rawValue)
        self.childNavigators.append(app)
    }
    
    private func createSettingsTab() {
        let settings = SettingsNavigator()
        settings.rootViewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), tag: Tab.settings.rawValue)
        self.childNavigators.append(settings)
    }
    
}
