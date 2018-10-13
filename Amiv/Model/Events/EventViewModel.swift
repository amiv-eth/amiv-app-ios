//
//  EventViewModel.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct EventViewModel {
    
    // MARK: - Variables
    
    let viewTitle: String
    let events: [AMIVEvent]
    
    // MARK: - Initializers
    
    public init(viewTitle: String, events: [AMIVEvent]) {
        self.viewTitle = viewTitle
        self.events = events
    }
    
    public init(response: EventsResponse) {
        self.init(viewTitle: "Events", events: response.events)
    }
}

extension EventViewModel {
    
    public static func empty() -> EventViewModel {
        return self.init(viewTitle: "Events", events: [])
    }
    
}
