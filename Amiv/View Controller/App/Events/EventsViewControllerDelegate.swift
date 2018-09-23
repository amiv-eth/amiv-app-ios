//
//  EventsViewControllerDelegate.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 21.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public protocol EventsViewControllerDelegate {
    
    func didSelectEvent(_ viewController: EventsViewController, section: Int, index: Int)
    
    func refreshData(_ viewController: EventsViewController)
    
}
