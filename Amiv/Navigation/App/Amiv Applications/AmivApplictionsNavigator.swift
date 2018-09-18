//
//  AmivApplictionsNavigator.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class AmivApplicationsNavigator: Navigator {
    
    // MARK: - Variables
    
    public var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    public init() {
        let root = AmivApplicationViewcontroller(model: AmivApplicationModel.createModels())
        self.navigationController = UINavigationController(rootViewController: root)
        
        root.delegate = self
    }
    
    private func snapToRoot() {
        self.navigationController.popToRootViewController(animated: true)
    }
}

extension AmivApplicationsNavigator: AmivApplicationActionDelegate {
    
    public func appIsFinished() {
        self.snapToRoot()
    }
    
}

extension AmivApplicationsNavigator: AmivApplicationViewControllerDelegate {
    
    public func start(app: AmivApplication) {
        debugPrint("starting app \(app)")
    }
    
}
