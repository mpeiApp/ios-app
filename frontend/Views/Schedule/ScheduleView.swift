//
//  ScheduleView.swift
//  frontend
//
//  Created by Анастасия Гусак on 11.10.2024.
//

import Foundation
import SwiftUI

struct ScheduleView: View {
    
    var body: some View {
        VStack() {
            ZStack {
                HStack {
                    Text("A-05-22")
                        .font(.custom("Inter-Regular_Bold", size: 18))
                }
                
                HStack {
                    Spacer()
                    Image("calendarIcon")
                        .resizable()
                        .frame(width: 20, height: 20) //
                }
                .padding(.trailing, 25)
            }
            WeekComponentView()
            LessonComponentView(
                lessonNumber: 2,
                lessonName: "Компьютерная графика",
                lessonAuditorium: "М-706",
                lessonBeginTime: "11:10",
                lessonEndTime: "12:45",
                lessonType: "Лабораторная",
                lessonLecturer: "Бартьеньев О.В.")
            .padding(.bottom, 20)
            LessonComponentView(
                lessonNumber: 3,
                lessonName: "Программная инженерия",
                lessonAuditorium: "М-708",
                lessonBeginTime: "13:45",
                lessonEndTime: "15:20",
                lessonType: "Лабораторная",
                lessonLecturer: "Мааран М.М.")
            .padding(.bottom, 20)
            Spacer()
        }

    }
}

#Preview {
    ScheduleView()
}
