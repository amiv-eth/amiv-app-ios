//
//  AmivApplicationCell.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class AmivApplicationCell: UITableViewCell {
    
    // MARK: - Variables
    
    // MARK: - View Variables
    
    public private(set) var titleLabel: UILabel!
    
    public private(set) var appImageView: UIImageView!
    
    // MARK: - Initializers
    
    public init(reuseIdentifier: String) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        // Create Views
        self.titleLabel = self.createTitleLabel()
        self.addSubview(self.titleLabel)
        
        self.appImageView = self.createImageView()
        self.addSubview(self.appImageView)
        
        // Apply Constraints
        self.applyTitleLabelConstraints()
        self.applyImageViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Creation
    
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func applyTitleLabelConstraints() {
        NSLayoutConstraint(item: self.titleLabel, attribute: .leading, relatedBy: .equal, toItem: self.appImageView, attribute: .trailing, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: self, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .topMargin, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottomMargin, multiplier: 1, constant: -8).isActive = true
    }
    
    private func createImageView() -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    private func applyImageViewConstraints() {
        NSLayoutConstraint(item: self.appImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.appImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.appImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottomMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: self.appImageView, attribute: .height, relatedBy: .equal, toItem: self.self.appImageView, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.appImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
    }
    
    // MARK: - View Setup
    
    public func prepareCell(model: AmivApplicationModel) {
        self.titleLabel.text = model.title
        self.appImageView.image = model.image
    }
}
