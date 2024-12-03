//
//  Lesson.swift
//  frontend
//
//  Created by Ivan Frolov on 02.12.2024.
//

import Foundation

struct Lesson: Codable, Identifiable {
    var id: String
    let discipline: String
    let auditorium: String
    let date: String
    let dayOfWeek: Int
    let time_begin: String
    let time_end: String
    let kindOfWork: String
    let lecturer: String
    let group_id: String
    let lessonNumber: Int
}
