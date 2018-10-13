//
//  FoodPreferenceModel.swift
//  Amiv
//
//  Created by Gabriel Sonderegger on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class FoodPreferenceModel{
    public private(set) var sectionModels: [FoodPreferenceSectionModel]
    
    // MARK: - Initializers
    
    public init(sectionModels: [FoodPreferenceSectionModel]) {
        self.sectionModels = sectionModels
    }
   //TODO Add Variables/Models
}
extension FoodPreferenceModel{
    
    public static func create() -> FoodPreferenceModel {
        let sections: [FoodPreferenceSectionModel] = [FoodPreferenceModel.createFoodPreferenceSection()]
        return FoodPreferenceModel(sectionModels: sections)
    }
    
    //TODO Make Dynamic
    public static func createFoodPreferenceSection() -> FoodPreferenceSectionModel {
        let vegetarisch = FoodPreferencesCellModel(text: "vegetarisch", action: .changeFoodPreference, cellType: .normal)
        let Nichts = FoodPreferencesCellModel(text: "Keine Vorlieben", action: .changeFoodPreference, cellType: .normal)
        
        return FoodPreferenceSectionModel(headerText: "Your Choice", footerText: "FooterText", cellModels: [vegetarisch, Nichts])
    }
    
}
