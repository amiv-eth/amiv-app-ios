//
//  JobOffersResponse.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 23.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct JobOffersResponse {
    
    var jobs: [JobOffer]
    
}

extension JobOffersResponse: Decodable {
    
    private enum JobOffersResponseCodingKeys: String, CodingKey {
        case jobs = "_items"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: JobOffersResponseCodingKeys.self)
        
        self.jobs = try container.decode([JobOffer].self, forKey: .jobs)
    }
    
}
