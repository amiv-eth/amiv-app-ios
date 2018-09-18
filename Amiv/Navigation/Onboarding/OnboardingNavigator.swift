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
    
    public var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    public init() {
        self.navigationController = UINavigationController()
    }
    
}
