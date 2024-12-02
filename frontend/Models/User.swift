//
//  User.swift
//  frontend
//
//  Created by Анастасия Гусак on 11.10.2024.
//

import Foundation

class StudentInfo: Codable {
    var login: String
    var name: String
    var surname: String
    var groupNumber: String
}

class PersonGradesInfo: Codable {
    var studentInfo: StudentInfo
    var subjects: [Subject]
}
