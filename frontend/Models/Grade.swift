//
//  Grade.swift
//  frontend
//
//  Created by Анастасия Гусак on 11.10.2024.
//

import Foundation

struct Grade: Codable, Identifiable {
    var id = UUID();
    var name: String;
    var weight: Int32;
    var dateStart: String?;
    var dateEnd: String;
    var weekNumber: Int32;
    var mark: Int32?;
    var markDate: String?;
    
    enum CodingKeys: String, CodingKey {
            case name
            case weight
            case dateStart
            case dateEnd
            case weekNumber
            case mark
            case markDate
        }
}

struct Subject: Codable, Identifiable {
    var id = UUID();
    var name: String;
    var teacher: String;
    var averageGrade: Double;
    var examinationType: String;
    var gradeList: [Grade];
    
    enum CodingKeys: String, CodingKey {
            case name
            case teacher
            case averageGrade
            case examinationType
            case gradeList
        }
}
