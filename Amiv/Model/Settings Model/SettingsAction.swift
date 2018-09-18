//
//  SettingsAction.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public enum SettingsAction {
    
    case none
    case changeValue(String)
    case toggleLogin
    
    public func indicator() -> UITableViewCell.AccessoryType {
        switch self {
        case .none, .toggleLogin:
            return .none
        case .changeValue:
            return .disclosureIndicator
        }
    }
    
    public func selectionStyle() -> UITableViewCell.SelectionStyle {
        switch self {
        case .none:
            return .none
        case .toggleLogin, .changeValue:
            return .default
        }
    }
}
