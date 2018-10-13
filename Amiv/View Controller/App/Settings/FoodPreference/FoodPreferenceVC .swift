//
//  ViewController.swift
//  Amiv
//
//  Created by Gabriel Sonderegger on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import UIKit

class FoodPreferenceViewController: UITableViewController {

    private var model: FoodPreferenceModel
    public var delegate: FoodPreferenceDelegate?
    // MARK: - Initializers
    
    init(model: FoodPreferenceModel) {
        self.model = model
        super.init(style: .grouped)
        self.title = "Food Preferences"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Creation
    
    // MARK: - View Setup
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
    }
}

// MARK: - FoodPreferenceVC TableView Extension

extension FoodPreferenceViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return self.model.sectionModels.count
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.sectionModels[section].cellModels.count
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.model.sectionModels[section].headerText
    }
    //Populate Table View
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellModel = self.model.sectionModels[indexPath.section].cellModels[indexPath.row]

        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.cellType.reuseIdentifier()) else {
                return UITableViewCell(style: cellModel.cellType.style(), reuseIdentifier: cellModel.cellType.reuseIdentifier())
            }
            return cell
        }()
        cell.textLabel?.text = cellModel.text
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name:"Avenir", size:22)
        cell.selectionStyle = cellModel.action.selectionStyle()
        cell.accessoryType = cellModel.action.indicator()
        return cell
    }

    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = self.model.sectionModels[indexPath.section].cellModels[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
        
        switch cellModel.action {
        case .none:
            break
        case .changeFoodPreference:
            self.delegate?.changeFoodPreference()
        }
    }
    
}

    
    
