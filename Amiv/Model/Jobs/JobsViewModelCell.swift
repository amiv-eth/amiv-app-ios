//
//  JobsViewModelCell.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 14.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct JobsViewModelCell {
    
    // MARK: - Variables
    
    public var title: String
    
    public var jobOffer: JobOffer
    
    // MARK: - Initializers
    
    public init(job: JobOffer) {
        self.title = job.title
        self.jobOffer = job
    }
    
}
