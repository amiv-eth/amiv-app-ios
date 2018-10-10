//
//  StudyDocumentResponse.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 10.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct StudyDocumentResponse: Decodable {
    
    public var _items: [StudyDocument]
    
}
