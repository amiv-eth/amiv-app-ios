//
//  AmivApplicationActionDelegate.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public protocol AmivApplicationActionDelegate {
    
    /// Call this function to indicate that the app is finished with it's task
    /// After this function is called, app will be killed.
    func appIsFinished()
    
}
