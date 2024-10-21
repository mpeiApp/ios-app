//
//  SubjectView.swift
//  frontend
//
//  Created by Анастасия Гусак on 21.10.2024.
//

import Foundation
import SwiftUI

struct SubjectView: View {
    var subject: Subject
    var dateFormatter: DateFormatter
    
    // Добавляем состояние для отслеживания состояния показа таблицы
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack (alignment: .leading){
                    HStack(alignment: .top) {
                        Text(subject.name)
                            .font(.custom("Inter-Regular_SemiBold", size: 16))
                            .foregroundColor(Color("AccentColor"))

                            Button(action: {
                                withAnimation {
                                    isExpanded.toggle() // Меняем состояние
                                }
                            }) {
                                Image("dropDownIcon")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .rotationEffect(.degrees(isExpanded ? 180 : 0)) // Переворот картинки
                        }
                    }
                    .padding(.bottom, 3)
                    Text(subject.examinationType)
                        .font(.custom("Inter-Regular_Medium", size: 12))
                        .foregroundColor(Color("secondaryColor"))
                        .padding(.bottom, 1)
                    Text(subject.teacher)
                        .font(.custom("Inter-Regular_Medium", size: 12))
                        .foregroundColor(Color("secondaryColor"))
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text("Средний")
                        .font(.custom("Inter-Regular_SemiBold", size: 8))
                        .foregroundColor(Color("secondaryColor"))
                        .padding(.bottom, 0.5)
                    
                    Text("балл")
                        .font(.custom("Inter-Regular_SemiBold", size: 8))
                        .foregroundColor(Color("secondaryColor"))
                        .padding(.bottom, 0.5)
                    
                    Text("\(subject.averageGrade, specifier: "%.1f")")
                        .font(.custom("Inter-Regular_SemiBold", size: 12))
                        .foregroundColor(Color("AccentColor"))

                }
            }
            .padding(.bottom, 2)

            // Условное отображение таблицы, если состояние isExpanded == true
            if isExpanded {
                TableHeaderView()

                // Таблица с оценками
                ForEach(subject.gradeList) { grade in
                    GradeRowView(grade: grade, dateFormatter: dateFormatter)
                }
            }
        }
        .padding()
    }
}
