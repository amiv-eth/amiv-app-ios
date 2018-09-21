//
//  HomeNavigator.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class HomeNavigator: Navigator {
    
    // MARK: - Variables
    
    public var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    public init() {
        let model = EventModel()
        let home = HomeViewController(model: model)
        self.navigationController = UINavigationController(rootViewController: home)
        self.navigationController.navigationBar.tintColor = .amivRed
    }
    
}
