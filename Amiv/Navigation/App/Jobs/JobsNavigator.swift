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
    
    let manager = NetworkManager<AMIVApiJobs>()
    
    private var quickLookDataSource: QuickLookDataSource?
    
    public var rootViewController: UIViewController {
        return self.navigationController
    }
    
    private var navigationController: UINavigationController
    
    // MARK: - Initializers
    
    public init() {
        let jobs = JobsViewController(model: JobsViewModel.empty())
        self.navigationController = UINavigationController(rootViewController: jobs)
        self.navigationController.navigationBar.tintColor = .amivRed
        jobs.delegate = self
        
        manager.getJobOffers { (offers, error) in
            guard error == nil, let offers = offers else {
                #warning("handle error")
                return
            }
            
            let model = JobsViewModel(jobOffers: offers)
            jobs.model = model
        }
    }
    
    // MARK: - Navigation
    
    private func goToJobsDetailView(model: GenericInfoViewControllerModel) {
        let info = GenericInfoViewController(model: model)
        info.delegate = self
        self.navigationController.pushViewController(info, animated: true)
    }
    
}

extension JobsNavigator: JobsViewControllerDelegate {
    
    public func didSelectJob(_ viewController: JobsViewController, job: JobOffer) {
        self.manager.getImage(for: job.logo.filePath) { (data, error) in
            DispatchQueue.main.async {
                guard error == nil, let data = data else {
                    let model = GenericInfoViewControllerModel(jobOffer: job, image: nil)
                    self.goToJobsDetailView(model: model)
                    return
                }
                
                let image = UIImage(data: data)
                let model = GenericInfoViewControllerModel(jobOffer: job, image: image)
                self.goToJobsDetailView(model: model)
            }
        }
    }
    
    public func refreshData(_ viewController: JobsViewController) {
        manager.getJobOffers { (offers, error) in
            guard error == nil, let offers = offers else {
                DispatchQueue.main.async {
                    viewController.tableView.refreshControl?.endRefreshing()
                }
                return
            }
            
            let model = JobsViewModel(jobOffers: offers)
            viewController.model = model
        }
    }
    
}

extension JobsNavigator: GenericInfoViewControllerDelegate {
    
    public func buttonTapped(_ viewController: GenericInfoViewController, action: GenericInfoViewControllerAction) {
        debugPrint("Info View button tapped")
        
        // TODO: - Show job description pdf using QLPreviewController
        // https://www.hackingwithswift.com/example-code/libraries/how-to-preview-files-using-quick-look-and-qlpreviewcontroller
        
        guard case .openPDF(let path) = action else {
            return
        }
        
        self.manager.getMedia(for: path) { (url, error) in
            guard error == nil, let url = url else {
                return
            }
            
            let quickLook = QLPreviewController()
            let dataSource = QuickLookDataSource(urls: [url])
            self.quickLookDataSource = dataSource
            quickLook.dataSource = dataSource
            DispatchQueue.main.async {
                self.navigationController.present(quickLook, animated: true, completion: nil)
            }
        }
        /*
        let url = Bundle.main.url(forResource: "Dienstverschiebungsgesuch", withExtension: "pdf")!
        let quickLook = QLPreviewController()
        let dataSource = QuickLookDataSource(urls: [url])
        self.quickLookDataSource = dataSource
        quickLook.dataSource = dataSource
        self.navigationController.present(quickLook, animated: true, completion: nil)
        */
    }
    
}
