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
    
    var sections: [JobsViewModelSection]
    
    // MARK: - Initializers
    
    public init(viewTitle: String, jobOffers: [(String, [JobOffer])]) {
        self.viewTitle = viewTitle
        self.sections = jobOffers.map({JobsViewModelSection(title: $0.0, jobs: $0.1)})
    }
    
    public init(jobOffers: [(String, [JobOffer])]) {
        self.init(viewTitle: "Jobs", jobOffers: jobOffers)
    }
    
}

extension JobsViewModel {
    
    public static func empty() -> JobsViewModel {
        return .init(jobOffers: [])
    }
    
}
