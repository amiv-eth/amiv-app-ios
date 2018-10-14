//
//  JobsViewModelSection.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 14.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct JobsViewModelSection {
    
    // MARK: - Variables
    
    public var title: String
    
    public var cells: [JobsViewModelCell]
    
    // MARK: - Initializers
    
    public init(title: String, jobs: [JobOffer]) {
        self.title = title
        self.cells = jobs.map({JobsViewModelCell(job: $0)})
    }
    
}
