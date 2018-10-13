//
//  FoodPreferencesSectionModel.swift
//  Amiv
//
//  Created by Gabriel Sonderegger on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class FoodPreferenceSectionModel {
    // MARK: - Variables
    
    public var headerText: String?
    public var footerText: String?
    public var footerTextAlignment: NSTextAlignment
    
    public var cellModels: [FoodPreferencesCellModel]
    
    // MARK: - Initializers
    
    public init(headerText: String?, footerText: String?, cellModels: [FoodPreferencesCellModel], footerTextAlignment: NSTextAlignment = .left) {
        self.headerText = headerText
        self.footerText = footerText
        self.footerTextAlignment = footerTextAlignment
        self.cellModels = cellModels
    }
    
    public convenience init(headerText: String?, footerText: String?) {
        self.init(headerText: headerText, footerText: footerText, cellModels: [])
    }
}
