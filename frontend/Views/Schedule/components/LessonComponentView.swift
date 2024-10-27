//
//  LessonComponentView.swift
//  frontend
//
//  Created by Ivan Frolov on 20.10.2024.
//

import SwiftUI

struct LessonComponentView: View {
    
    var lessonNumber: Int
    var lessonName: String
    var lessonAuditorium: String
    var lessonBeginTime: String
    var lessonEndTime: String
    var lessonType: String
    var lessonLecturer: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(lessonNumber). \(lessonName)")
                    .font(.custom("Inter-Regular_SemiBold", size: 18))
                    .padding(.leading, 15)
                Spacer()
                Text("\(lessonAuditorium)")
                    .font(.custom("Inter-Regular_SemiBold", size: 16))
                    .padding(.trailing, 15)
                    .foregroundStyle(Color("secondaryColor"))
            }
            Text("\(lessonBeginTime) - \(lessonEndTime) · \(lessonType)")
                .font(.custom("Inter-Regular_Medium", size: 14))
                .padding(.leading, 35)
                .foregroundStyle(Color("secondaryColor"))
            Text("\(lessonLecturer)")
                .font(.custom("Inter-Regular_Medium", size: 14))
                .padding(.leading, 35)
                .foregroundStyle(Color("secondaryColor"))
        }
    }
}

#Preview {
    LessonComponentView(
        lessonNumber: 2,
        lessonName: "Компьютерная графика",
        lessonAuditorium: "М-706",
        lessonBeginTime: "11:10",
        lessonEndTime: "12:45",
        lessonType: "Лабораторная",
        lessonLecturer: "Бартьеньев О.В.")
}
