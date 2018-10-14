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
    
    public let networkManager = NetworkManager<AMIVApiEvents>()
    
    public var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    public init() {
        let events = EventsViewController(model: .create(with: nil))
        self.navigationController = UINavigationController(rootViewController: events)
        self.navigationController.navigationBar.tintColor = .amivRed
        events.delegate = self
        
        self.refreshData(events)
    }
    
    // MARK: - Navigation
    
    private func goToEventDetailView(model: GenericInfoViewControllerModel) {
        let info = GenericInfoViewController(model: model)
        info.delegate = self
        self.navigationController.pushViewController(info, animated: true)
    }
    
}

extension EventsNavigator: EventsViewControllerDelegate {
    
    public func didSelectEvent(_ viewController: EventsViewController, section: Int, index: Int) {
        debugPrint("didSelect section: \(section) and index: \(index)")
        
        // TODO: - Retrieve event, convert into GenericInfoViewControllerModel and show Detail View
        // let model = ...
        self.goToEventDetailView(model: .createTestModel())
    }
    
    public func refreshData(_ viewController: EventsViewController) {
        debugPrint("Refreshing Events Data")
        
        self.networkManager.getEvents { (response, error) in
            if let response = response {
                DispatchQueue.main.async {
                    viewController.model = .create(with: response)
                }
            }
        }
    }
    
}
extension EventsNavigator: GenericInfoViewControllerDelegate {
    
    public func buttonTapped(_ viewController: GenericInfoViewController) {
        debugPrint("Info View button tapped")
        
        // TODO: - Sign up for event
    }
    
}
