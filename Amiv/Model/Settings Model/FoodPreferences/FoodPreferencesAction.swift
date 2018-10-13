//
//  FoodPreferencesAction.swift
//  Amiv
//
//  Created by Gabriel Sonderegger on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public enum FoodPreferencesAction {
    
    case none
    case changeFoodPreference
    
    public func indicator() -> UITableViewCell.AccessoryType {
        switch self {
        case .none, .changeFoodPreference:
            return .none
        }
    }
    public func selectionStyle() -> UITableViewCell.SelectionStyle {
        switch self {
        case .none:
            return .none
        case .changeFoodPreference:
            return .default
        }
    }
}
