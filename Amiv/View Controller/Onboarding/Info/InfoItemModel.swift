//
//  InfoItemModel.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 19.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public struct InfoItemModel {
    
    // MARK: - Variables
    
    public let title: String
    
    public let text: String
    
    public let image: UIImage?
    
    // MARK: - Initializers
    
    public init(title: String, text: String, image: UIImage?) {
        self.title = title
        self.text = text
        self.image = image
    }
    
}

extension InfoItemModel {
    
    public static func create() -> [InfoItemModel] {
        let first = self.init(title: "Events", text: "Register for upcoming events.", image: nil)
        let second = self.init(title: "Jobs", text: "Get informations about the latest and greates job offers.", image: nil)
        let third = self.init(title: "Apps", text: "Use microapps like 'Barcode ID' and 'AMIV Helper Apps'.", image: nil)
        
        return [first, second, third]
    }
    
}
