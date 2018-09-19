//
//  InfoViewControllerModel.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 19.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct InfoViewControllerModel {
    
    // MARK: - Variables
    
    public let infoItems: [InfoItemModel]
    
    public let title: String
    
    public let buttonTitle: String
    
    public let smallButtonTitle: String?
    
    // MARK: - Initializers
    
    public init(title: String, infoItems: [InfoItemModel], buttonTitle: String, smallButtonTitle: String?) {
        self.title = title
        self.infoItems = infoItems
        self.buttonTitle = buttonTitle
        self.smallButtonTitle = smallButtonTitle
    }
    
}

extension InfoViewControllerModel {
    
    public static func create() -> InfoViewControllerModel {
        return self.init(title: "App Features", infoItems: InfoItemModel.create(), buttonTitle: "Login", smallButtonTitle: "Skip")
    }
    
}
