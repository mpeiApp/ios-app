//
//  GradeRowView.swift
//  frontend
//
//  Created by Анастасия Гусак on 21.10.2024.
//

import Foundation
import SwiftUI

struct GradeRowView: View {
    var grade: Grade
    var dateFormatter: DateFormatter

    var body: some View {
        HStack {
            // Название задания
            Text(grade.name)
                .font(.custom("Inter-Regular_Medium", size: 10))
                .foregroundColor(Color("AccentColor"))
                .frame(minWidth: 180, maxWidth: .infinity, alignment: .leading)
                .layoutPriority(0)
            
            // Вес
            Text("\(grade.weight)")
                .font(.custom("Inter-Regular_Medium", size: 10))
                .foregroundColor(Color("AccentColor"))
                .frame(minWidth: 30, maxWidth: 40, alignment: .leading)
                .fixedSize(horizontal: true, vertical: false)
            
            // Дата
            Text(
                "\(grade.weekNumber) неделя\n" +
                "(\(grade.dateStart != nil ?  grade.dateStart! + "-\n" : "")" +
                "\(grade.dateEnd))"
            )
            .font(.custom("Inter-Regular_Medium", size: 10))
            .foregroundColor(Color("AccentColor"))
            .frame(minWidth: 50, maxWidth: 130, alignment: .leading)
            .layoutPriority(1)
            
            // Оценка
            Text(
                "\(grade.mark != nil ? String(grade.mark!) : "")\n" +
                "\(grade.markDate != nil ? "(" + grade.markDate! + ")" : "")"
            )
                .font(.custom("Inter-Regular_Medium", size: 10))
                .foregroundColor(Color("AccentColor"))
                .frame(minWidth: 60, maxWidth: 130, alignment: .leading)
                .layoutPriority(1)
        }
        .padding(.vertical, 3)
    }
}

