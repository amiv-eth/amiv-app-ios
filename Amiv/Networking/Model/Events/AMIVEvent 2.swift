//
//  AMIVEvent.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct AMIVEvent {
    
    public let id: String
    public let title: String
    public let catchPhrase: String
    public let location: String
    public let startTime: Date
    public let endTime: Date
    public let description: String
    public let price: Int
    public let spots: Int
    public let signupCount: Int
    public let image: AMIVMedia?
    
}

extension AMIVEvent: Decodable {
    
    private enum EventItemResponseCodingKeys: String, CodingKey {
        case id = "_id"
        case titleEn = "title_en"
        case titleDe = "title_de"
        case catchPhraseEn = "catchphrase_en"
        case catchPhraseDe = "catchphrase_de"
        case location = "location"
        case startTime = "time_start"
        case endTime = "time_end"
        case descriptionEn = "description_en"
        case descriptionDe = "description_de"
        case price = "price"
        case spots = "spots"
        case signupCount = "signup_count"
        case image = "img_poster"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EventItemResponseCodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        
        let titleEn = try container.decode(String.self, forKey: .titleEn)
        let titleDe = try container.decode(String.self, forKey: .titleDe)
        self.title = Locale.getLocalizedString(english: titleEn, german: titleDe)
        
        let catchPhraseEn = try container.decode(String.self, forKey: .catchPhraseEn)
        let catchPhraseDe = try container.decode(String.self, forKey: .catchPhraseDe)
        self.catchPhrase = Locale.getLocalizedString(english: catchPhraseEn, german: catchPhraseDe)
        
        self.location = try container.decode(String.self, forKey: .location)
        
        if let startTime = try container.decode(String.self, forKey: .startTime).toDate() {
            self.startTime = startTime
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [EventItemResponseCodingKeys.startTime], debugDescription: "Invalid date string"))
        }
        
        if let endTime = try container.decode(String.self, forKey: .endTime).toDate() {
            self.endTime = endTime
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [EventItemResponseCodingKeys.endTime], debugDescription: "Invalid date string"))
        }
        
        let descriptionEn = try container.decode(String.self, forKey: .descriptionEn)
        let descriptionDe = try container.decode(String.self, forKey: .descriptionDe)
        self.description = Locale.getLocalizedString(english: descriptionEn, german: descriptionDe)
        
        self.price = try container.decode(Int.self, forKey: .price)
        self.spots = try container.decode(Int.self, forKey: .spots)
        self.signupCount = try container.decode(Int.self, forKey: .signupCount)
        
        self.image = try? container.decode(AMIVMedia.self, forKey: .image)
    }
    
}
