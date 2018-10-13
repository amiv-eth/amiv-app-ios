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
    let modelFP : FoodPreferenceModel?
    
    public var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private let navigationController: UINavigationController
    
    // MARK: - Initializers
    
    public init() {
        let model = SettingsModel.create()
        modelFP = FoodPreferenceModel.create()
        
        let settings = SettingsViewController(model: model)
        self.navigationController = UINavigationController(rootViewController: settings)
        self.navigationController.navigationBar.tintColor = .amivRed
        settings.delegate = self
    }
    
}

//Action onClick calls
extension SettingsNavigator: SettingsViewControllerDelegate {
    
    private func changeVC(ViewController : UITableViewController){
        self.navigationController.pushViewController(ViewController , animated: true)
    }
    
    public func toggleLogin() {
        let alert = UIAlertController(title: "Do you want to logout?", message: "If you log out you're required to log in again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        //TODO add Completion Handler for logout
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.navigationController.present(alert, animated: true, completion: nil)
    }
    public func pushNotification() {
        debugPrint("push notification")
    }
    // 2. Sektion in den Settings,
    public func changeValue(for key: String) {
        switch (key) {
            case "food":
                let viewController = FoodPreferenceViewController(model: modelFP!)
                viewController.delegate = self
                changeVC(ViewController: viewController)
                debugPrint("change value for key food")
                break;
            case "pubTrans":
                changeVC(ViewController: pubTransVC())
            case "pushNotification":
                debugPrint("change value for key pushNotification")
            default:
                break;
        }
    }
}
extension SettingsNavigator: FoodPreferenceDelegate {
    public func changeFoodPreference() {
        debugPrint("Dismissing View Controller")
        self.navigationController.popViewController(animated: true)
        
    }
    
}

