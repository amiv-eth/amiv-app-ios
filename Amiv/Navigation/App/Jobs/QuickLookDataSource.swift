//
//  QuickLookDataSource.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 21.09.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation
import UIKit
import QuickLook

public class QuickLookDataSource: QLPreviewControllerDataSource {
    
    // MARK: - Variables
    
    public let urls: [URL]
    
    // MARK: - Initializers
    
    public init(urls: [URL]) {
        self.urls = urls
    }
    
    // MARK: - Data Source
    
    public func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return self.urls.count
    }
    
    public func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return self.urls[index] as QLPreviewItem
    }
    
    
    
    
}
