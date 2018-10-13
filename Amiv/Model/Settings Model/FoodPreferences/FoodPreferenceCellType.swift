//
//  FoodPreferenceCellType.swift
//  Amiv
//
//  Created by Gabriel Sonderegger on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public enum FoodPreferenceCellType {
    
    case normal
    
    public func reuseIdentifier() -> String {
      return "FoodCell"
    }
    
    public func style() -> UITableViewCell.CellStyle {
        switch self {
        case .normal:
            return .default
        }
    }
}
