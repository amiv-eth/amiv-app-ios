//
//  BlurButton.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 20.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public class BlurButton: UIButton {
    
    // MARK: - Variables
    
    public let style: UIBlurEffect.Style
    
    // MARK: - View Variables
    
    public private(set) var blurBackgroundView: UIVisualEffectView!
    
    // MARK: - Initializers
    
    public init(style: UIBlurEffect.Style) {
        self.style = style
        super.init(frame: .null)
        
        self.blurBackgroundView = self.createBackgroundLayer(style)
        self.insertSubview(self.blurBackgroundView, at: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Creation
    
    private func createBackgroundLayer(_ style: UIBlurEffect.Style) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: self.style)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.isUserInteractionEnabled = false
        blurredEffectView.isExclusiveTouch = false
        
        return blurredEffectView
    }
    
    // MARK: - Layout
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.blurBackgroundView.frame = self.bounds
    }
    
}
