//
//  SettingsViewController.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class SettingsViewController: UITableViewController {
    
    // MARK: - View Variables
    
    // MARK: - Variables
    
    private var model: SettingsModel
    private var CustomIdentifier = "customIdentifier"
    public var delegate: SettingsViewControllerDelegate?
    
    // MARK: - Initializers
    
    public init(model: SettingsModel) {
        self.model = model
        super.init(style: .grouped)
        self.title = "Settings"
        
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomIdentifier)
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

// MARK: - SettingsViewController TableView Extension

extension SettingsViewController {
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return self.model.sectionModels.count
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model.sectionModels[section].cellModels.count
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.model.sectionModels[section].headerText
    }
    
    public override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.model.sectionModels[section].footerText
    }
    
    public override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        if let footer = view as? UITableViewHeaderFooterView {
            footer.textLabel?.textAlignment = self.model.sectionModels[section].footerTextAlignment
        }
    }
    
    //Populate Table View
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellModel = self.model.sectionModels[indexPath.section].cellModels[indexPath.row]
        var cell = UITableViewCell()
        
        
        switch cellModel.cellType {
        case .custom:
            cell = tableView.dequeueReusableCell(withIdentifier: CustomIdentifier, for: indexPath) as! CustomTableViewCell
            return cell
        case .changeValue:
             cell = UITableViewCell(style: cellModel.cellType.style(), reuseIdentifier: cellModel.cellType.reuseIdentifier())
            populateNormalCell(cell: cell, cellModel: cellModel)
            return cell
        case .login:
              cell = UITableViewCell(style: cellModel.cellType.style(), reuseIdentifier: cellModel.cellType.reuseIdentifier())
            populateNormalCell(cell: cell, cellModel: cellModel)
            return cell
        case .normal:
                cell = UITableViewCell(style: cellModel.cellType.style(), reuseIdentifier: cellModel.cellType.reuseIdentifier())
            populateNormalCell(cell: cell, cellModel: cellModel)
            return cell
            
            }
        /*
        let cellModel = self.model.sectionModels[indexPath.section].cellModels[indexPath.row]
        let cell: UITableViewCell = {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.cellType.reuseIdentifier()) else {
                return UITableViewCell(style: cellModel.cellType.style(), reuseIdentifier: cellModel.cellType.reuseIdentifier())
            }
            return cell
        }()
         */
        
    }
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = self.model.sectionModels[indexPath.section].cellModels[indexPath.row]
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
        
        switch cellModel.action {
        case .none:
            break
        case .toggleLogin:
            self.delegate?.toggleLogin()
        case .changeValue(let value):
            self.delegate?.changeValue(for: value)
        }
    }
    
    private func populateNormalCell(cell : UITableViewCell, cellModel : SettingsCellModel){
        cell.textLabel?.text = cellModel.text
        cell.detailTextLabel?.text = cellModel.detailText
        cell.textLabel?.numberOfLines = 0
        cell.accessoryType = cellModel.action.indicator()
        cell.tintColor = UIColor(named: "lightBlue")
        cell.selectionStyle = cellModel.action.selectionStyle()
        
    }
   
}
