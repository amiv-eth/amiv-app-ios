//
//  AmivMicroAppBarcode.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 26.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class AmivMicroAppBarcode: AmivMicroApp {
    
    // MARK: - Variables
    
    public var delegate: AmivMicroAppDelegate
    
    public var rootViewController: UIViewController {
        return barcodeController
    }
    
    private var barcodeController: UIViewController = UIViewController()
    
    // MARK: - Initializers
    
    public init(delegate: AmivMicroAppDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - App lifetime
    
    public func start() -> Bool {
        return true
    }
}
