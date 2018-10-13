//
//  JobOffer.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 10.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct JobOffer {
    
    var id: String
    var company: String
    var title: String
    var description: String
    var endTime: Date
    var logo: AMIVMedia
    var pdf: AMIVMedia
    
}

extension JobOffer: Decodable {
    
    private enum JobOfferCodingKeys: String, CodingKey {
        
        case id = "_id"
        case company = "company"
        
        case titleEn = "title_en"
        case titleDe = "title_de"
        case descriptionEn = "description_en"
        case descriptionDe = "description_de"
        
        case endTime = "time_end"
        
        case logo = "logo"
        case pdf = "pdf"
        
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: JobOfferCodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.company = try container.decode(String.self, forKey: .company)
        
        let titleEn = try container.decode(String.self, forKey: .titleEn)
        let titleDe = try container.decode(String.self, forKey: .titleDe)
        self.title = Locale.getLocalizedString(english: titleEn, german: titleDe)
        
        let descriptionEn = try container.decode(String.self, forKey: .descriptionEn)
        let descriptionDe = try container.decode(String.self, forKey: .descriptionDe)
        self.description = Locale.getLocalizedString(english: descriptionEn, german: descriptionDe)
        
        let timeString = try container.decode(String.self, forKey: .endTime)
        if let time = timeString.toDate() {
            self.endTime = time
        } else {
            self.endTime = Date()
        }
        
        self.logo = try container.decode(AMIVMedia.self, forKey: .logo)
        self.pdf = try container.decode(AMIVMedia.self, forKey: .pdf)
    }
    
}
