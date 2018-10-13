//
//  SettingsCellType.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public enum SettingsCellType {
    
    case normal
    case login
    case changeValue
    case custom
    
    public func reuseIdentifier() -> String {
        switch self {
        case .normal:
            return "cell"
        case .login:
            return "login"
        case .changeValue:
            return "changeValue"
        case .custom:
            return "custom"
        }
    }
    
    public func style() -> UITableViewCell.CellStyle {
        switch self {
        case .normal:
            return .default
        case .changeValue:
            return .subtitle
        case .login:
            return .subtitle
        case .custom:
            return .default
        }
    }
}
