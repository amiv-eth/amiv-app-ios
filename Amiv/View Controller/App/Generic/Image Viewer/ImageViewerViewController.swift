//
//  ImageViewerViewController.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 20.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class ImageViewerViewController: UIViewController {
    
    // MARK: - Variables
    
    // MARK: - View Variables
    
    public private(set) var dismissButton: UIButton!
    
    public private(set) var imageView: UIImageView!
    
    public private(set) var scrollView: UIScrollView!
    
    // MARK: - Initializers
    
    public init(image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        
        // View Creation
        self.scrollView = self.createScrollView()
        self.view.addSubview(self.scrollView)
        
        self.imageView = self.createImageView(image)
        self.scrollView.addSubview(imageView)
        
        self.dismissButton = self.createDismissButton()
        self.view.addSubview(self.dismissButton)
        
        // View Constraints
        self.applyImageViewConstraints()
        self.applyScrollViewConstraints()
        self.applyDismissButtonConstraints()
        
        // Swipe down to dismiss viewer gesture
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(self.dismissView))
        gesture.direction = .down
        self.view.addGestureRecognizer(gesture)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Creation
    
    private func createDismissButton() -> UIButton {
        let button = BlurButton(style: .prominent)
        button.setTitle("Close", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.darkGray, for: .highlighted)
        //button.backgroundColor = .white
        button.addTarget(self, action: #selector(self.dismissView), for: .touchUpInside)
        button.layer.cornerRadius = 17
        button.layer.masksToBounds = true
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    private func applyDismissButtonConstraints() {
        NSLayoutConstraint(item: self.dismissButton, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item:  self.dismissButton, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
        NSLayoutConstraint(item: self.dismissButton, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: -10).isActive = true
        NSLayoutConstraint(item: self.dismissButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 34).isActive = true
    }
    
    private func createImageView(_ image: UIImage) -> UIImageView {
        let view = UIImageView()
        view.image = image
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    private func applyImageViewConstraints() {
        NSLayoutConstraint(item: self.imageView, attribute: .top, relatedBy: .equal, toItem: self.scrollView, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item:  self.imageView, attribute: .leading, relatedBy: .equal, toItem: self.scrollView, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.imageView, attribute: .trailing, relatedBy: .equal, toItem: self.scrollView, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.imageView, attribute: .bottom, relatedBy: .equal, toItem: self.scrollView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.imageView, attribute: .centerX, relatedBy: .equal, toItem: self.scrollView, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.imageView, attribute: .centerY, relatedBy: .equal, toItem: self.scrollView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
    }
    
    private func createScrollView() -> UIScrollView {
        let view = UIScrollView()
        view.minimumZoomScale = 1.0
        view.maximumZoomScale = 5.0
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }
    
    private func applyScrollViewConstraints() {
        NSLayoutConstraint(item: self.scrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item:  self.scrollView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.scrollView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.scrollView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
    }
    
    // MARK: - View Setup
    
    // MARK: - View Interaction
    
    @objc private func dismissView() {
        debugPrint("dismissing ImageViewer")
        self.dismiss(animated: false, completion: nil)
    }
    
}

extension ImageViewerViewController: UIScrollViewDelegate {
    
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
}
