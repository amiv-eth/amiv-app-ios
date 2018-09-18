//
//  SettingsViewControllerDelegate.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public protocol SettingsViewControllerDelegate {
    
    func toggleLogin()
    
    func pushNotification()
    
    func changeValue(for key: String)
    
}
