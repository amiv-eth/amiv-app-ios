//
//  Local+Extension.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 12.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public extension Locale {
    
    public enum AppLanguage {
        case german
        case english
    }
    
    public static func current() -> AppLanguage {
        if ["de-DE", "de-CH", "de-AT", "de-LI", "de-LU"].contains(Locale.current.languageCode) {
            return .german
        } else {
            return .english
        }
    }
    
    public static func getLocalizedString(english: String, german: String) -> String {
        switch Locale.current() {
        case .english:
            return english
        case .german:
            return german
        }
    }
    
}
