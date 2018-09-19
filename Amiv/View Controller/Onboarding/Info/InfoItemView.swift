//
//  InfoItemView.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 19.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class InfoItemView: UIView {
    
    // MARK: - Variables
    
    // MARK: - View Variables
    
    public private(set) var imageView: UIImageView!
    
    public private(set) var titleLabel: UILabel!
    
    public private(set) var infoLabel: UILabel!
    
    // MARK: - Initializers
    
    public init(frame: CGRect = .null, model: InfoItemModel) {
        super.init(frame: frame)
        
        // Create View
        self.imageView = self.createImageView(model.image)
        self.addSubview(self.imageView)
        
        self.titleLabel = self.createTitleLabel(model.title)
        self.addSubview(self.titleLabel)
        
        self.infoLabel = self.createInfoLabel(model.text)
        self.addSubview(self.infoLabel)
        
        // Apply Constraints
        self.applyImageViewConstraints()
        self.applyTitleLabelConstraints()
        self.applyInfoLabelConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Creation
    
    private func createImageView(_ image: UIImage?) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }
    
    private func applyImageViewConstraints() {
        NSLayoutConstraint(item: self.imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.imageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.imageView, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottomMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: self.imageView, attribute: .height, relatedBy: .equal, toItem: self.imageView, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
    }
    
    private func createTitleLabel(_ title: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = title
        label.textColor = .amivRed
        label.font = UIFont.preferredFont(forTextStyle: .body).bold()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func applyTitleLabelConstraints() {
        NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self.imageView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .leading, relatedBy: .equal, toItem: self.imageView, attribute: .trailing, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
    }
    
    private func createInfoLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func applyInfoLabelConstraints() {
        NSLayoutConstraint(item: self.infoLabel, attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .bottom, multiplier: 1, constant: 8).isActive = true
        NSLayoutConstraint(item: self.infoLabel, attribute: .leading, relatedBy: .equal, toItem: self.titleLabel, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.infoLabel, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: self, attribute: .bottomMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.infoLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
    }
    
    // MARK: - View Interaction
    
}
