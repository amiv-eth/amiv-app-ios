//
//  HomeViewController.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class HomeViewController: UITableViewController {
    
    // MARK: - Variables
    
    public var model: EventModel {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Initializers
    
    public init(model: EventModel) {
        self.model = model
        
        super.init(style: .plain)
        
        self.title = "Home"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic
    }
    
    // MARK: - View Interaction
    
}

extension HomeViewController {
    
}
