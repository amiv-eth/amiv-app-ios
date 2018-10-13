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
    
    public let subtitle: String
    
    public let image: UIImage?
    
    // MARK: - Initializers
    
    public init(app: AmivMicroAppType, title: String, subtitle: String, image: UIImage?) {
        self.app = app
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
    
}

extension AmivMicroAppModel {
    
    public static func createModels() -> [AmivMicroAppModel] {
        let models: [AmivMicroAppModel] = [.createCheckinModel(), .createBarcodeModel()]
        return models
    }
    
    public static func createCheckinModel() -> AmivMicroAppModel {
        return self.init(app: .checkin, title: "Checkin", subtitle: "Checkin AMIV Members in and out of AMIV events.", image: UIImage(named: "settings"))
    }
    
    public static func createBarcodeModel() -> AmivMicroAppModel {
        return self.init(app: .barcode, title: "Barcode ID", subtitle: "Display your legi barcode digitally.", image: UIImage(named: "barcodeID"))
    }

}
