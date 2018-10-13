//
//  AmivMicroAppCellView.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class AmivMicroAppCellView: UIView {
    
    // MARK: - Variables
    
    // MARK: - View Variables
    
    public private(set) var titleLabel: UILabel!
    
    public private(set) var subtitleLabel: UILabel!
    
    public private(set) var appImageView: UIImageView!
    
    // MARK: - Initializers
    
    public override init(frame: CGRect = .null) {
        super.init(frame: frame)
        
        // Create Views
        self.titleLabel = self.createTitleLabel()
        self.addSubview(self.titleLabel)
        
        self.subtitleLabel = self.createSubtitleLabel()
        self.addSubview(self.subtitleLabel)
        
        self.appImageView = self.createImageView()
        self.addSubview(self.appImageView)
        
        // Apply Constraints
        self.applyTitleLabelConstraints()
        self.applySubtitleLabelConstraints()
        self.applyImageViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Creation
    
    private func createTitleLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body).bold()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func applyTitleLabelConstraints() {
        NSLayoutConstraint(item: self.titleLabel, attribute: .leading, relatedBy: .equal, toItem: self.appImageView, attribute: .trailing, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: self, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: self.appImageView, attribute: .top, multiplier: 1, constant: 0).isActive = true
    }
    
    private func createSubtitleLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func applySubtitleLabelConstraints() {
        NSLayoutConstraint(item: self.subtitleLabel, attribute: .leading, relatedBy: .equal, toItem: self.titleLabel, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.subtitleLabel, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: self, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: self.subtitleLabel, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: self.titleLabel, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: self.subtitleLabel, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottomMargin, multiplier: 1, constant: -8).isActive = true
    }
    
    private func createImageView() -> UIImageView {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    private func applyImageViewConstraints() {
        NSLayoutConstraint(item: self.appImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.appImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: self.appImageView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottomMargin, multiplier: 1, constant: -8).isActive = true
        NSLayoutConstraint(item: self.appImageView, attribute: .height, relatedBy: .equal, toItem: self.self.appImageView, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.appImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
    }
    
    // MARK: - View Setup
    
    // MARK: - View Interaction
    
}
