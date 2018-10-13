//
//  JobsViewModel.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 12.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct JobsViewModel {
    
    // MARK: - Variables
    
    var viewTitle: String
    
    var jobOffers: [JobOffer]
    
    // MARK: - Initializers
    
    public init(viewTitle: String, jobOffers: [JobOffer]) {
        self.viewTitle = viewTitle
        self.jobOffers = jobOffers
    }
    
    public init(jobOffers: [JobOffer]) {
        self.init(viewTitle: "Jobs", jobOffers: jobOffers)
    }
    
}

extension JobsViewModel {
    
    public static func empty() -> JobsViewModel {
        return .init(jobOffers: [])
    }
    
}
