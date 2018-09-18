//
//  SettingsNavigator.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class SettingsNavigator: Navigator {
    
    // MARK: - Variables
    
    public var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private let navigationController: UINavigationController
    
    // MARK: - Initializers
    
    public init() {
        let model = SettingsModel.create()
        let settings = SettingsViewController(model: model)
        self.navigationController = UINavigationController(rootViewController: settings)
        settings.delegate = self
    }
    
}

extension SettingsNavigator: SettingsViewControllerDelegate {
    
    public func toggleLogin() {
        debugPrint("toggle login")
    }
    
    public func pushNotification() {
        debugPrint("push notification")
    }
    
    public func changeValue(for key: String) {
        debugPrint("change value for key \(key)")
    }
}
