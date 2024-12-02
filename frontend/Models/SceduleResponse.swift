//
//  SceduleResponse.swift
//  frontend
//
//  Created by Ivan Frolov on 02.12.2024.
//

import Foundation

struct ScheduleResponse: Codable {
    let message: String
    let data: [String: [Lesson]]
}
