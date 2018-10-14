//
//  JSONParser.swift
//  Amiv
//
//  Created by Gabriel Sonderegger on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public  class AdditField{
    
    public static let ARRAY : Int  = 0;
    public static let BOOLEAN : Int = 1;
    public static let INTEGER : Int = 2;
    public static let NULL : Int  = 3;
    public static let NUMBER : Int  = 4;
    public static let OBJECT  : Int = 5;
    public static let STRING : Int = 6;
    
}


public class JSONParser {
    
    public var SbbAbos : [String]!
    public var FoodTypes : [String]!
    public var SFR : String!
    
    public func parseJSONData(Filename: String) {
        guard let path = Bundle.main.path(forResource: Filename, ofType: "json") else {
            debugPrint("failed to get JSON Path")
            return}
            do {
                let content = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                let jsonData = content.data(using: .utf8)!
                let decoder = JSONDecoder()
                let result = try decoder.decode(Root.self, from: jsonData)
                debugPrint("successfully parsed JSON File")
                //Copy Results to String-Arrays and Strings
                dump(result.properties)
                SbbAbos = result.properties.sbbAbo.Enum
                FoodTypes = result.properties.Food.Enum
                SFR = result.properties.SFR.type
                
            } catch {
                print("Error info: \(error)")
            }
    }
}

public func CountPropertiesElements(){
    
}

//Definiere JSON Dictionarys als structs, nach Vorlage SampleEventAdditFields.json
extension JSONParser{
    
    public struct Root : Decodable {
        private enum CodingKeys : String, CodingKey { case properties = "properties" }
        let properties : PropertiesStruct
    }
    
    public struct PropertiesStruct : Decodable {
        private enum CodingKeys : String, CodingKey {
            case sbbAbo = "SBB_Abo"
            case Food = "Food"
            case SFR = "Special Food Requirements"
        }
        let sbbAbo : sbbAboStruct
        let Food : FoodStruct
        let SFR : SFRStruct
    }
    
    public struct sbbAboStruct : Decodable {
        private enum CodingKeys : String, CodingKey {
            case type = "type"
            case Enum = "enum"
        }
        let type : String
        let Enum : [String]
    }
    public struct FoodStruct : Decodable {
        private enum CodingKeys : String, CodingKey {
            case type = "type"
            case Enum = "enum"
        }
        let type : String
        let Enum : [String]
    }
    public struct SFRStruct : Decodable {
        private enum CodingKeys : String, CodingKey {
            case type = "type"
        }
        let type : String
    }
}

