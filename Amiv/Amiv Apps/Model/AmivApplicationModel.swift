//
//  AmivApplicationModel.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 18.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit

public struct AmivApplicationModel {
    
    public let app: AmivApplication
    
    public let title: String
    
    public let image: UIImage?
    
    // MARK: - Initializers
    
    public init(app: AmivApplication, title: String, image: UIImage?) {
        self.app = app
        self.title = title
        self.image = image
    }
    
}

extension AmivApplicationModel {
    
    public static func createModels() -> [AmivApplicationModel] {
        let models: [AmivApplicationModel] = [.createCheckinModel(), .createBarcodeModel()]
        return models
    }
    
    public static func createCheckinModel() -> AmivApplicationModel {
        return self.init(app: .checkin, title: "Checkin", image: nil)
    }
    
    public static func createBarcodeModel() -> AmivApplicationModel {
        return self.init(app: .barcode, title: "Barcode", image: nil)
    }

}
