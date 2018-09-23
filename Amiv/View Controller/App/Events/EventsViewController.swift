//
//  EventsViewController.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 20.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class EventsViewController: UITableViewController {
    
    // MARK: - Variables
    
    public var delegate: EventsViewControllerDelegate?
    
    public var model: EventsResponse? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Initializers
    
    public init(model: EventsResponse?) {
        self.model = model
        super.init(style: .plain)
        self.title = "Events"
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
    
    // MARK: - View Interaction
    
    @objc private func refreshData() {
        self.delegate?.refreshData()
    }
    
}

// MARK: - Table View Data Source

extension EventsViewController {
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let model = self.model {
            return model.events.count
        }
        return 0
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
                return UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
            }
            return cell
        }()
        
        guard let model = self.model else {
            return cell
        }
        
        cell.textLabel?.text = model.events[indexPath.row].title
        cell.detailTextLabel?.text = model.events[indexPath.row].catchPhrase
        
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Events"
    }
    
}

// MARK: - Table View Delegate

extension EventsViewController {
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectEvent(section: indexPath.section, index: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
