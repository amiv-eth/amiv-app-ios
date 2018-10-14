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
}
extension FoodPreferenceModel{
    
    public static func create() -> FoodPreferenceModel {
        let sections: [FoodPreferenceSectionModel] = [FoodPreferenceModel.createFoodPreferenceSection()]
        return FoodPreferenceModel(sectionModels: sections)
    }
    
  //Parse JSON into Table View
    public static func createFoodPreferenceSection() -> FoodPreferenceSectionModel {
        let jsonParser = JSONParser()
        var FoodCellModel = [FoodPreferencesCellModel]()
        jsonParser.parseJSONData(Filename: "SampleEventAdditFields")
        jsonParser.FoodTypes.forEach { (Food) in
            let food = FoodPreferencesCellModel(text: Food, action: .changeFoodPreference, cellType: .normal)
            FoodCellModel.append(food)
        }
        return FoodPreferenceSectionModel(headerText: "Your Choice", footerText: "FooterText", cellModels: FoodCellModel)
 }
    
}
