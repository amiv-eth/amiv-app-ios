//
//  JSONParser.swift
//  Amiv
//
//  Created by Gabriel Sonderegger on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class JSONParser {
    
    public func getJSONData(Filename: String){
        guard let path = Bundle.main.path(forResource: Filename, ofType: "json") else {
            debugPrint("failed to get JSON Path")
            return}
            do {
                let content = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                let jsonData = content.data(using: .utf8)!
                let decoder = JSONDecoder()
                let result = try decoder.decode(Root.self, from: jsonData)
                dump(result)
            } catch {
                print("Error info: \(error)")
            }
    }
}

//Definiere JSON Dictionarys als structs, nach Vorlage SampleEventAdditFields.json

struct Root : Decodable {
    private enum CodingKeys : String, CodingKey { case properties = "properties" }
    let properties : PropertiesStruct
}

struct PropertiesStruct : Decodable {
    private enum CodingKeys : String, CodingKey {
        case sbbAbo = "SBB_Abo"
        case Food = "Food"
        case SFR = "Special Food Requirements"
    }
    let sbbAbo : sbbAboStruct
    let Food : FoodStruct
    let SFR : SFRStruct
}

struct sbbAboStruct : Decodable {
    private enum CodingKeys : String, CodingKey {
        case type = "type"
        case Enum = "enum"
    }
    let type : String
    let Enum : [String]
}
struct FoodStruct : Decodable {
    private enum CodingKeys : String, CodingKey {
        case type = "type"
        case Enum = "enum"
    }
    let type : String
    let Enum : [String]
}
struct SFRStruct : Decodable {
    private enum CodingKeys : String, CodingKey {
        case type = "type"
    }
    let type : String
}
