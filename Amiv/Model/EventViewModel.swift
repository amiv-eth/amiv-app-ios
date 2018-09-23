//
//  EventViewModel.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct EventViewModel {
    
    let title: String
    let eventResponse: EventsResponse?
    
}

extension EventViewModel {
    
    public static func create(with response: EventsResponse?) -> EventViewModel {
        return self.init(title: "Events", eventResponse: response)
    }
    
}
