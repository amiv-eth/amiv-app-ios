//
//  AmivApplicationViewController.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class AmivApplicationViewcontroller: UITableViewController {
    
    // MARK: - Variables
    
    fileprivate let reuseIdentifer = "amivApplicationCell"
    
    public var delegate: AmivApplicationViewControllerDelegate?
    
    public var model: [AmivApplicationModel]
    
    // MARK: - Initializers
    
    public init(model: [AmivApplicationModel]) {
        self.model = model
        
        super.init(style: .plain)
        
        self.title = "Apps"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        self.view.backgroundColor = .white
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - View Interaction
    
}

// MARK: - Collection View Data Source Extension

extension AmivApplicationViewcontroller {
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AmivApplicationCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifer) as? AmivApplicationCell else {
                return AmivApplicationCell(reuseIdentifier: self.reuseIdentifer)
            }
            return cell
        }()
        
        let model = self.model[indexPath.row]
        cell.prepareCell(model: model)
        
        return cell
    }
    
}

// MARK: - Collection View Delegate

extension AmivApplicationViewcontroller {
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.start(app: self.model[indexPath.row].app)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
