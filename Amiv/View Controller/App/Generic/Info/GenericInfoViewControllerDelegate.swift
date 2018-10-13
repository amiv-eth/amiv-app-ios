//
//  GenericInfoViewControllerDelegate.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 20.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public protocol GenericInfoViewControllerDelegate {
    
    func buttonTapped(_ viewController: GenericInfoViewController, action: GenericInfoViewControllerAction)
    
}
