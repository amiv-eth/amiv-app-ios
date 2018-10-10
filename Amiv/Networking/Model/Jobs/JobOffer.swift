//
//  JobOffer.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 10.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

public struct JobOffer: Decodable {
    
    var title_en: String
    var title_de: String
    
    var description_en: String
    var description_de: String
    
    var pdf: Data
    
}
