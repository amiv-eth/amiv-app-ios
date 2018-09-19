//
//  LoginModel.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 19.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct LoginModel {
    
    // MARK: - Variables
    
    public let title: String
    
    public let infoText: String
    
    public let buttonTitle: String
    
    public let smallButtonTitle: String
    
    // MARK: - Initializers
    
    public init(title: String, infoText: String, buttonTitle: String, smallButtonTitle: String) {
        self.title = title
        self.infoText = infoText
        self.buttonTitle = buttonTitle
        self.smallButtonTitle = smallButtonTitle
    }
    
}

extension LoginModel {
    
    public static func createOnboarding() -> LoginModel {
        let infoText = "Login in using your ETHZ username (email address) and your ETHZ password."
        return self.init(title: "Login", infoText: infoText, buttonTitle: "Login", smallButtonTitle: "Skip")
    }
    
    public static func createNormal() -> LoginModel {
        let infoText = "Login in using your ETHZ username (email address) and your ETHZ password."
        return self.init(title: "Login", infoText: infoText, buttonTitle: "Login", smallButtonTitle: "Cancel")
    }
    
}
