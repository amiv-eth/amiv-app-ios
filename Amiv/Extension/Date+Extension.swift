//
//  Date+Extension.swift
//  Amiv
//
//  Created by Domenic Wüthrich on 14.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import Foundation

extension Date {
    
    public var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    public var string: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: self)
    }
    
}
