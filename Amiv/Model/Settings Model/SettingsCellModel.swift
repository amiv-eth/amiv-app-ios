//
//  SettingsCellModel.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public class SettingsCellModel {
    
    // MARK: - Variables
    
    public var text: String
    
    public var detailText: String?
    
    public var action: SettingsAction
    
    public var cellType: SettingsCellType
    
    // MARK: - Initializers
    
    public init(text: String, detailText: String? = nil, action: SettingsAction, cellType: SettingsCellType = .normal) {
        self.text = text
        self.detailText = detailText
        self.action = action
        self.cellType = cellType
    }
    
}
