//
//  AmivMicroApp.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 26.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public protocol AmivMicroApp {
    
    /// The rootViewController called when application will start
    var rootViewController: UIViewController { get }
    
    /// Indicates if the app is ready or not
    /// Do all additional setup in this method
    /// This method is called right before the app will be shown
    /// - Returns: return true to indicate that the app is ready
    /// - Note: If you return false, app will get killed
    func start() -> Bool
}
