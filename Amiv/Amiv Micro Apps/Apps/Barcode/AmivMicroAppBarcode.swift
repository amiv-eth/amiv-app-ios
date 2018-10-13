//
//  AmivMicroAppBarcode.swift
//  Amiv
//
//  Created by Denis Zuppiger on 12.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class AmivMicroAppBarcode: AmivMicroApp {
    
    // MARK: - Variables
    
    public var delegate: AmivMicroAppDelegate
    
    public var rootViewController: UIViewController {
        return navigationController
    }
    
    public var navigationController: UINavigationController = {
        let nav = UINavigationController()
        return nav
    }()
    
    private var barcodeController: UIViewController = {
        let con  = BarcodeViewController(model: AmivMicroAppModel.createBarcodeModel())
        return con
    }()
    
    // MARK: - Initializers
    
    public init(delegate: AmivMicroAppDelegate) {
        self.delegate = delegate
        navigationController.pushViewController(barcodeController, animated: false)
    }
    
    // MARK: - App lifetime
    
    public func start() -> Bool {
        return true
    }
}
