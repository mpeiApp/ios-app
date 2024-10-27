//
//  ScheduleView.swift
//  frontend
//
//  Created by Анастасия Гусак on 11.10.2024.
//

import Foundation
import SwiftUI

struct ScheduleView: View {
    
    var firstMonday: Date
    var lastMonday: Date
    let weeksSemester: [[Date]]
    
    var today: Date = Date()
    
    @State  var activeIndex: Int
    @State  var currentPage: Int
    
    init() {
        firstMonday = getMonday(day: "2024-09-02")
        lastMonday = getMonday(day: "2024-12-31")
        weeksSemester = getWeeksSemester(firstMonday: firstMonday, lastMonday: lastMonday)
        
        // Инициализация activeIndex и currentPage для сегодняшнего дня
        var tempActiveIndex = 0
        var tempCurrentPage = 0
        
        for (weekIndex, week) in weeksSemester.enumerated() {
            if let dayIndex = week.firstIndex(where: { Calendar.current.isDate($0, inSameDayAs: Date()) }) {
                tempActiveIndex = weekIndex * 7 + dayIndex
                tempCurrentPage = weekIndex
                break
            }
        }
        
        _activeIndex = State(initialValue: tempActiveIndex)
        _currentPage = State(initialValue: tempCurrentPage)
        
        weeksSemester.forEach { week in
            print(week)
        }
    }
    
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
            
            WeeksScrollComponentView(weeks: weeksSemester, activeIndex: $activeIndex, currentPage: $currentPage)
            
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
            if (activeIndex / 7 < weeksSemester.count && activeIndex / 7 > -1 && weeksSemester[activeIndex / 7].count != 0) {
                Text("Selected day: \(weeksSemester[activeIndex / 7][activeIndex % 7])")
                    .font(.headline)
                    .padding()
            }
            Spacer()
        }

    }
}

#Preview {
    ScheduleView()
}
