//
//  GenericInfoViewController.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 20.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class GenericInfoViewController: UIViewController {
    
    // MARK: - Variables
    
    public var delegate: GenericInfoViewControllerDelegate?
    
    // MARK: - View Variables
    
    public private(set) var scrollView: UIScrollView!
    
    private var imageContainerView: UIView?
    
    public private(set) var imageView: UIImageView?
    
    public private(set) var textView: UITextView!
    
    public private(set) var button: UIButton?
    
    // MARK: - Initializers
    
    public init(model: GenericInfoViewControllerModel) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
        
        // View Creation
        self.scrollView = self.createScrollView()
        self.view.addSubview(self.scrollView)
        
        if let image = model.image {
            let container = self.createImageContainerView()
            self.imageContainerView = container
            self.scrollView.addSubview(container)
            
            let view = self.createImageView(image)
            self.imageView = view
            self.scrollView.addSubview(view)
        }
        
        self.textView = self.createTextView(model.text)
        self.scrollView.addSubview(self.textView)
        
        if let title = model.titleButton {
            let button = self.createButton(title)
            self.button = button
            self.scrollView.addSubview(button)
        }
        
        // View Constraints
        self.applyScrollViewConstraints()
        self.applyImageContainerViewConstraints()
        self.applyImageViewConstraints()
        self.applyTextViewConstraints()
        self.applyButtonConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Creation
    
    private func createScrollView() -> UIScrollView {
        let view = UIScrollView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    private func applyScrollViewConstraints() {
        NSLayoutConstraint(item: self.scrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.scrollView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.scrollView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.scrollView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    
    private func createImageView(_ image: UIImage?) -> UIImageView {
        let view = UIImageView()
        view.image = image
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    private func applyImageViewConstraints() {
        guard let imageView = self.imageView, let container = self.imageContainerView else {
            return
        }
        
        let top = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1, constant: 0)
        top.priority = UILayoutPriority(rawValue: 900)
        top.isActive = true
        NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottomMargin, multiplier: 1, constant: 0).isActive = true
    }
    
    private func createImageContainerView() -> UIView {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    private func applyImageContainerViewConstraints() {
        guard let containerView = self.imageContainerView else {
            return
        }
        
        NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: self.scrollView, attribute: .topMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item:  containerView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: containerView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.7, constant: 0).isActive = true
    }
    
    private func createTextView(_ text: String) -> UITextView {
        let textView = UITextView()
        textView.text = text
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }
    
    private func applyTextViewConstraints() {
        if let imageView = self.imageView {
            NSLayoutConstraint(item: self.textView, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1, constant: 10).isActive = true
        } else {
            NSLayoutConstraint(item: self.textView, attribute: .top, relatedBy: .equal, toItem: self.scrollView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        }
        
        NSLayoutConstraint(item: self.textView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.textView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 0).isActive = true
        
        if self.button == nil {
            NSLayoutConstraint(item: self.textView, attribute: .bottom, relatedBy: .equal, toItem: self.scrollView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        }
    }
    
    private func createButton(_ title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.backgroundColor = .amivRed
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    private func applyButtonConstraints() {
        guard let button = self.button else {
            return
        }
        
        NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: self.textView, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: self.scrollView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
    }
    
    // MARK: - View Setup
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - View Interaction
    
    @objc private func buttonTapped() {
        debugPrint("button tapped")
        self.delegate?.buttonTapped()
    }
    
}
