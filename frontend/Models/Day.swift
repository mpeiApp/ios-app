//
//  Day.swift
//  frontend
//
//  Created by Ivan Frolov on 15.10.2024.
//

import Foundation


class Day: Codable, Identifiable {
    var dayOfWeek: String
    var day: Int
    var month: String
    var isActive: Bool
    
    init(dayOfWeek: String, day: Int, month: String, isActive: Bool) {
        self.dayOfWeek = dayOfWeek
        self.day = day
        self.month = month
        self.isActive = isActive
    }
}
