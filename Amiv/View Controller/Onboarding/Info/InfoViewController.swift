//
//  InfoViewController.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 19.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class InfoViewController: UIViewController {
    
    // MARK: - Variables
    
    public var delegate: InfoViewControllerDelegate?
    
    // MARK: - View Variables
    
    public private(set) var titleLabel: UILabel!
    
    public private(set) var infoViewCollection: [InfoItemView] = []
    
    public private(set) var button: UIButton!
    
    public private(set) var smallButton: UIButton?
    
    // MARK: - Initializers
    
    public init(model: InfoViewControllerModel) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
        
        // View Creation
        self.titleLabel = self.createTitleLabel(model.title)
        self.view.addSubview(self.titleLabel)
        
        self.button = self.createButton(model.buttonTitle)
        self.view.addSubview(self.button)
        
        if let title = model.smallButtonTitle {
            let button = self.createSmallButton(title)
            self.smallButton = button
            self.view.addSubview(button)
        }
        
        for index in 0..<model.infoItems.count {
            let view = self.createInfoView(model.infoItems[index])
            self.infoViewCollection.append(view)
            self.view.addSubview(view)
        }
        
        // Apply Constraints()
        self.applyTitleLabelConstraints()
        self.applyButtonConstraints()
        self.applySmallButtonConstraints()
        for index in 0..<self.infoViewCollection.count {
            self.applyInfoViewConstraints(index)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Creation
    
    private func createTitleLabel(_ title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = .amivRed
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle).bold()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func applyTitleLabelConstraints() {
        NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
    }
    
    private func createInfoView(_ model: InfoItemModel) -> InfoItemView {
        let view = InfoItemView(model: model)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    private func applyInfoViewConstraints(_ index: Int) {
        if index == 0 {
            NSLayoutConstraint(item: self.infoViewCollection[index], attribute: .top, relatedBy: .equal, toItem: self.titleLabel, attribute: .bottom, multiplier: 1, constant: 40).isActive = true
        } else {
            NSLayoutConstraint(item: self.infoViewCollection[index], attribute: .top, relatedBy: .equal, toItem: self.infoViewCollection[index-1], attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        }
        
        NSLayoutConstraint(item: self.infoViewCollection[index], attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.infoViewCollection[index], attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
    }
    
    private func createButton(_ title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundColor(.amivRed, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    private func applyButtonConstraints() {
        if self.smallButton ==
            nil {
            //NSLayoutConstraint(item: self.button, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: self.infoViewCollection.last, attribute: .bottom, multiplier: 1, constant: 30).isActive = true
        }
        NSLayoutConstraint(item: self.button, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.button, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: self.button, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottomMargin, multiplier: 1, constant: -20).isActive = true
        NSLayoutConstraint(item: self.button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
    }
    
    private func createSmallButton(_ title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.amivRed, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.addTarget(self, action: #selector(self.smallButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    private func applySmallButtonConstraints() {
        guard let smallButton = self.smallButton else {
            return
        }
        
        //NSLayoutConstraint(item: smallButton, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: self.infoViewCollection.last, attribute: .bottom, multiplier: 1, constant: 30).isActive = true
        NSLayoutConstraint(item: smallButton, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: smallButton, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: smallButton, attribute: .bottom, relatedBy: .equal, toItem: self.button, attribute: .top, multiplier: 1, constant: -15).isActive = true
    }
    
    // MARK: - View Setup
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - View Interaction
    
    @objc private func buttonAction() {
        self.delegate?.buttonPressed()
        debugPrint("button pressed")
    }
    
    @objc private func smallButtonAction() {
        self.delegate?.smallButtonPressed()
        debugPrint("smallButton pressed")
    }
    
}
