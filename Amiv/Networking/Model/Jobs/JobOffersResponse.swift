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

extension JobOffersResponse {
    
    public func sortJobs() -> [(String, [JobOffer])] {
        let sorted = self.jobs.sorted(by: {$0.company.lowercased() <= $1.company.lowercased()})
        
        guard let first = sorted.first else {
            return []
        }
        var together = [[first]]
        sorted.dropFirst().forEach { (offer) in
            if offer.company == together.last?.first?.company {
                together[together.count-1].append(offer)
            } else {
                together.append([offer])
            }
            print(together)
        }
        return together.map({($0.first!.company, $0)})
    }
    
}
