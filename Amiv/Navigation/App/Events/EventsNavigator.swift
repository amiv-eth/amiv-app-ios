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
        let events = EventsViewController(model: .empty())
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
    
    public func didSelectEvent(_ viewController: EventsViewController, event: AMIVEvent) {
        
        if let eventImage = event.image {
            self.networkManager.getImage(for: eventImage.filePath) { (data, error) in
                let model: GenericInfoViewControllerModel
                if error == nil, let data = data {
                    let image = UIImage(data: data)
                    model = GenericInfoViewControllerModel(event: event, image: image)
                } else {
                    model = GenericInfoViewControllerModel(event: event, image: nil)
                }
                DispatchQueue.main.async {
                    self.goToEventDetailView(model: model)
                }
            }
        } else {
            let model = GenericInfoViewControllerModel(event: event, image: nil)
            self.goToEventDetailView(model: model)
        }
    }
    
    public func refreshData(_ viewController: EventsViewController) {
        self.networkManager.getEvents { (response, error) in
            guard let response = response else {
                DispatchQueue.main.async {
                    viewController.tableView.refreshControl?.endRefreshing()
                }
                return
            }
            DispatchQueue.main.async {
                viewController.model = EventViewModel(response: response)
            }
        }
    }
    
}

extension EventsNavigator: GenericInfoViewControllerDelegate {
    
    public func buttonTapped(_ viewController: GenericInfoViewController, action: GenericInfoViewControllerAction) {
        debugPrint("Info View button tapped")
        
        // TODO: - Sign up for event
    }
    
}
