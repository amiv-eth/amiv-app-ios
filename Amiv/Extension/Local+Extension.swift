//
//  Local+Extension.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 12.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public extension Locale {
    
    public enum AppLanguage: String {
        case german = "de"
        case english = "en"
    }
    
    public static func current() -> AppLanguage {
        if let language = Locale.preferredLanguages.first, language == AppLanguage.german.rawValue {
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
