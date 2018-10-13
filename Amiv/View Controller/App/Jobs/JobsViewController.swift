//
//  JobsViewController.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 20.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class JobsViewController: UITableViewController {
    
    // MARK: - Variables
    
    public var model: JobsViewModel {
        didSet {
            self.updateView()
        }
    }
    
    public var delegate: JobsViewControllerDelegate?
    
    // MARK: - Initializers
    
    public init(model: JobsViewModel) {
        self.model = model
        super.init(style: .plain)
        
        self.title = model.viewTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.refreshData), for: .primaryActionTriggered)
        self.tableView.refreshControl = refreshControl
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        self.refreshControl?.endRefreshing()
    }
    
    private func updateView() {
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
            self.title = self.model.viewTitle
            self.tableView.reloadData()
        }
    }
    
    // MARK: - View Interaction
    
    @objc private func refreshData() {
        self.delegate?.refreshData(self)
    }
    
}

// MARK: - Table View Data Source

extension JobsViewController {
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.jobOffers.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.model.jobOffers[indexPath.row]
        
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell") else {
                return UITableViewCell(style: .subtitle, reuseIdentifier: "JobCell")
            }
            return cell
        }()
        
        cell.textLabel?.text = model.title
        cell.detailTextLabel?.text = model.company
        
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Jobs"
    }
    
}

// MARK: - Table View Delegate

extension JobsViewController {
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectJob(self, job: self.model.jobOffers[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
