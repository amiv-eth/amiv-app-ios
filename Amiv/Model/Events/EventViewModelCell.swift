//
//  EventViewModelCell.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 14.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct EventViewModelCell {
    
    // MARK: - Variables
    
    public let title: String
    
    public let subtitle: String
    
    public let additionalInfo: String
    
    public let event: AMIVEvent
    
    // MARK: - Initializers
    
    public init(event: AMIVEvent) {
        self.title = event.title
        self.subtitle = event.catchPhrase
        self.additionalInfo = String(describing: event.spots - event.signupCount)
        self.event = event
    }
    
}
