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
    var dateStart: Date;
    var dateEnd: Date;
    var weekNumber: Int32;
    var mark: Int32;
    var markDate: Date;
}

struct Subject: Codable, Identifiable {
    var id = UUID();
    var name: String;
    var teacher: String;
    var averageGrade: Double;
    var examinationType: String;
    var gradeList: [Grade];
}
