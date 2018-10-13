//
//  EventTableViewCell.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class EventTableViewCell: UITableViewCell {
    
    // MARK: - Variables
    
    // MARK: - View Variables
    
    public private(set) var titleLabel: UILabel!
    
    public private(set) var subtitleLabel: UILabel!
    
    public private(set) var additionalInfoLabel: UILabel!
    
    // MARK: - Initializers
    
    public init(reuseIdentifier: String) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        // Create Views
        self.titleLabel = self.createTitleLabel()
        self.addSubview(self.titleLabel)
        self.subtitleLabel = self.createSubtitleLabel()
        self.addSubview(self.subtitleLabel)
        self.additionalInfoLabel = self.createAdditionalInfoLabel()
        self.addSubview(self.additionalInfoLabel)
        
        // Apply Constraints
        self.applyTitleLabelConstraints()
        self.applySubtitleLabelConstraints()
        self.applyAdditionalInfoLabelConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Creation
    
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body).bold()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func applyTitleLabelConstraints() {
        NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
    }
    
    private func createSubtitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func applySubtitleLabelConstraints() {
        NSLayoutConstraint(item: self.subtitleLabel, attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: self.subtitleLabel, attribute: .leading, relatedBy: .equal, toItem: self.titleLabel, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.subtitleLabel, attribute: .trailing, relatedBy: .equal, toItem: self.titleLabel, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.subtitleLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottomMargin, multiplier: 1, constant: -8).isActive = true
    }
    
    private func createAdditionalInfoLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func applyAdditionalInfoLabelConstraints() {
        NSLayoutConstraint(item: self.additionalInfoLabel, attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.additionalInfoLabel, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: self.titleLabel, attribute: .trailing, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: self.additionalInfoLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailingMargin, multiplier: 1, constant: -8).isActive = true
        NSLayoutConstraint(item: self.additionalInfoLabel, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottomMargin, multiplier: 1, constant: -8).isActive = true
    }
    
    // MARK: - View Setup
    
    public func setupView(title: String, subtitle: String, additionalInfo: String) {
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        self.additionalInfoLabel.text = additionalInfo
    }
    
    // MARK: - View Interaction
    
    
}
