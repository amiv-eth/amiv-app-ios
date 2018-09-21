//
//  EventsNavigator.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 20.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class EventsNavigator: Navigator {
    
    // MARK: - Variables
    
    public var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    public init() {
        let home = EventsViewController()
        self.navigationController = UINavigationController(rootViewController: home)
        self.navigationController.navigationBar.tintColor = .amivRed
        home.delegate = self
    }
    
    // MARK: - Navigation
    
    private func goToEventDetailView(model: GenericInfoViewControllerModel) {
        let info = GenericInfoViewController(model: model)
        info.delegate = self
        self.navigationController.pushViewController(info, animated: true)
    }
    
}

extension EventsNavigator: EventsViewControllerDelegate {
    
    public func didSelectEvent(section: Int, index: Int) {
        debugPrint("didSelect section: \(section) and index: \(index)")
        
        // TODO: - Retrieve event, convert into GenericInfoViewControllerModel and show Detail View
        // let model = ...
        self.goToEventDetailView(model: .createTestModel())
    }
    
    public func refreshData() {
        debugPrint("Refreshing Events Data")
    }
    
}

extension EventsNavigator: GenericInfoViewControllerDelegate {
    
    public func buttonTapped() {
        debugPrint("Info View button tapped")
        
        // TODO: - Sign up for event
    }
    
}
