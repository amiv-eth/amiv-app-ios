//
//  AmivMicroAppsCell.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class AmivMicroAppsCell: UITableViewCell {
    
    // MARK: - Variables
    
    // MARK: - View Variables
    
    public private(set) var cellView: AmivMicroAppCellView!
    
    // MARK: - Initializers
    
    public init(reuseIdentifier: String) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        // Create Views
        self.cellView = self.createCellView()
        self.addSubview(self.cellView)
        self.applyCellViewConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Creation
    
    private func createCellView() -> AmivMicroAppCellView {
        let view = AmivMicroAppCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    private func applyCellViewConstraints() {
        NSLayoutConstraint(item: self.cellView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.cellView, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: self, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: self.cellView, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .topMargin, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: self.cellView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottomMargin, multiplier: 1, constant: -8).isActive = true
    }
    
    // MARK: - View Setup
    
    public func prepareCell(model: AmivMicroAppModel) {
        self.cellView.titleLabel.text = model.title
        self.cellView.subtitleLabel.text = model.subtitle
        self.cellView.appImageView.image = model.image
    }
}
