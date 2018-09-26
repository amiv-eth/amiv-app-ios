//
//  AmivMicroAppModelModel.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public struct AmivMicroAppModel {
    
    public let app: AmivMicroAppType
    
    public let title: String
    
    public let image: UIImage?
    
    // MARK: - Initializers
    
    public init(app: AmivMicroAppType, title: String, image: UIImage?) {
        self.app = app
        self.title = title
        self.image = image
    }
    
}

extension AmivMicroAppModel {
    
    public static func createModels() -> [AmivMicroAppModel] {
        let models: [AmivMicroAppModel] = [.createCheckinModel(), .createBarcodeModel()]
        return models
    }
    
    public static func createCheckinModel() -> AmivMicroAppModel {
        return self.init(app: .checkin, title: "Checkin", image: nil)
    }
    
    public static func createBarcodeModel() -> AmivMicroAppModel {
        return self.init(app: .barcode, title: "Barcode", image: nil)
    }

}
