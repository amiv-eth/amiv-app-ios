//
//  JobsNavigator.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit
import QuickLook

public class JobsNavigator: Navigator {
    
    // MARK: - Variables
    
    private var quickLookDataSource: QuickLookDataSource?
    
    public var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    public init() {
        let jobs = JobsViewController()
        self.navigationController = UINavigationController(rootViewController: jobs)
        self.navigationController.navigationBar.tintColor = .amivRed
        jobs.delegate = self
    }
    
    // MARK: - Navigation
    
    private func goToJobsDetailView(model: GenericInfoViewControllerModel) {
        let info = GenericInfoViewController(model: model)
        info.delegate = self
        self.navigationController.pushViewController(info, animated: true)
    }
    
}

extension JobsNavigator: JobsViewControllerDelegate {
    
    public func didSelectJob(section: Int, index: Int) {
        debugPrint("didSelect section: \(section) and index: \(index)")
        
        // TODO: - Retrieve job, convert into GenericInfoViewControllerModel and show Detail View
        // let model = ...
        self.goToJobsDetailView(model: .createTestModel())
    }
    
    public func refreshData() {
        debugPrint("Refreshing Jobs Data")
    }
    
}

extension JobsNavigator: GenericInfoViewControllerDelegate {
    
    public func buttonTapped() {
        debugPrint("Info View button tapped")
        
        // TODO: - Show job description pdf using QLPreviewController
        // https://www.hackingwithswift.com/example-code/libraries/how-to-preview-files-using-quick-look-and-qlpreviewcontroller
        
        #warning("replace with actual pdf data")
        
        let url = Bundle.main.url(forResource: "Dienstverschiebungsgesuch", withExtension: "pdf")!
        let quickLook = QLPreviewController()
        let dataSource = QuickLookDataSource(urls: [url])
        self.quickLookDataSource = dataSource
        quickLook.dataSource = dataSource
        self.navigationController.present(quickLook, animated: true, completion: nil)
    }
    
}
