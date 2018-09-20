//
//  EventsNavigator.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 20.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class EventsNavigator: Navigator {
    
    // MARK: - Variables
    
    public var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    public init() {
        let home = EventsViewController()
        self.navigationController = UINavigationController(rootViewController: home)
    }
    
}