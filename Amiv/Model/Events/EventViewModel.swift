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
    let sections: [EventViewModelSection]
    
    // MARK: - Initializers
    
    public init(viewTitle: String, events: [(String, [AMIVEvent])]) {
        self.viewTitle = viewTitle
        self.sections = events.map({EventViewModelSection(sectionTitle: $0.0, cells: $0.1)})
    }
    
    public init(response: EventsResponse) {
        let events = response.sortEvents()
        self.init(viewTitle: "Events", events: events)
    }
}

extension EventViewModel {
    
    public static func empty() -> EventViewModel {
        return self.init(viewTitle: "Events", events: [])
    }
    
}
