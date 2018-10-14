//
//  EventViewModelSection.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 14.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct EventViewModelSection {
    
    // MARK: - Variables
    
    public let sectionTitle: String
    
    public let cells: [EventViewModelCell]
    
    // MARK: - Initializers
    
    public init(sectionTitle: String, cells: [AMIVEvent]) {
        self.sectionTitle = sectionTitle
        self.cells = cells.map({EventViewModelCell(event: $0)})
    }
    
}
