//
//  UIButton+Extension.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 21.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public extension UIButton {
    
    public func setBackgroundColor(_ color: UIColor, for state: UIButton.State) {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), true, 0.0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        self.setBackgroundImage(image, for: state)
    }
    
}
