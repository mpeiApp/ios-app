//
//  GradesResponse.swift
//  frontend
//
//  Created by Анастасия Гусак on 02.12.2024.
//

import Foundation

struct GradesResponse: Codable {
    let message: String
    let data: PersonGradesInfo
}
