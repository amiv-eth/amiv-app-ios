//
//  FoodPreferencesCell.swift
//  Amiv
//
//  Created by Gabriel Sonderegger on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import UIKit

public class FoodPreferencesCellModel {
    // MARK: - Variables

    public var text: String

    public var action: FoodPreferencesAction

    public var cellType: FoodPreferenceCellType

    // MARK: - Initializers
    public init(text: String, action: FoodPreferencesAction, cellType: FoodPreferenceCellType = .normal) {
        self.text = text
       self.action = action
        self.cellType = cellType
    }
}
