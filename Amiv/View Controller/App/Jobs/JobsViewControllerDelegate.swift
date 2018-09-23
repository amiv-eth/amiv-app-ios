//
//  JobsViewControllerDelegate.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 21.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public protocol JobsViewControllerDelegate {
    
    func didSelectJob(_ viewController: JobsViewController, section: Int, index: Int)
    
    func refreshData(_ viewController: JobsViewController)
    
}
