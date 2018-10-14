//
//  NumberFormatter+Extension.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 14.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

extension NumberFormatter {
    
    public static func priceString(for price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "de_CH")
        
        if let priceString = formatter.string(from: price as NSNumber) {
            return priceString
        } else {
            return String(describing: price)
        }
    }
    
}
