//
//  AmivMicroAppsNavigator.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class AmivMicroAppsNavigator: Navigator {
    
    // MARK: - Variables
    
    public var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    public init() {
        let root = AmivMicroAppsViewController(model: AmivMicroAppModel.createModels())
        self.navigationController = UINavigationController(rootViewController: root)
        self.navigationController.navigationBar.tintColor = .amivRed
        
        root.delegate = self
    }
    
    private func snapToRoot() {
        self.navigationController.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - App Creation
    
    private func createApp(_ app: AmivMicroAppType) -> AmivMicroApp {
        switch app {
        case .checkin:
            return AmivMicroAppCheckin(delegate: self)
        case .barcode:
            return AmivMicroAppBarcode(delegate: self)
        }
    }
}

extension AmivMicroAppsNavigator: AmivMicroAppDelegate {
    
    public func appIsFinished() {
        self.snapToRoot()
    }
    
}

extension AmivMicroAppsNavigator: AmivMicroAppsViewControllerDelegate {
    
    public func start(app: AmivMicroAppType) {
        let microApp = self.createApp(app)
        if microApp.start() {
            microApp.rootViewController.modalTransitionStyle = .coverVertical
            self.navigationController.present(microApp.rootViewController, animated: true, completion: nil)
        } else {
            debugPrint("micro app start did not return true")
            // TODO: - Show error message.
        }
    }
    
}
