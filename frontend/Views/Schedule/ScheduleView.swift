//
//  ScheduleView.swift
//  frontend
//
//  Created by Анастасия Гусак on 11.10.2024.
//

import Foundation
import SwiftUI

struct ScheduleView: View {
    
    @StateObject private var networkManager = ScheduleNetworkManager()
    
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
        
//        weeksSemester.forEach { week in
//            print(week)
//        }
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
                        .frame(width: 20, height: 20)
                        .onTapGesture {
                            if let storedUsername = UserDefaults.standard.string(forKey: "username"),
                               let storedPassword = UserDefaults.standard.string(forKey: "password"),
                               let storedResponseData = UserDefaults.standard.value(forKey: "group_id") as? Int {
                                print("Username: \(storedUsername)")
                                print("Password: \(storedPassword)")
                                print("Response Data: \(storedResponseData)")
                            }
                        }
                }
                .padding(.trailing, 25)
            }
            .padding(.top)
            
            WeeksScrollComponentView(weeks: weeksSemester, activeIndex: $activeIndex, currentPage: $currentPage)
            
            if let schedule = networkManager.scheduleData {
                
                if let lessons = schedule.data[formatDateToString(weeksSemester[activeIndex / 7][activeIndex % 7])]
                {
                    ForEach(lessons) { lesson in
                        LessonComponentView(
                            lessonNumber: lesson.lessonNumber,
                            lessonName: lesson.discipline,
                            lessonAuditorium: lesson.auditorium,
                            lessonBeginTime: lesson.time_begin,
                            lessonEndTime: lesson.time_end,
                            lessonType: lesson.kindOfWork,
                            lessonLecturer: lesson.lecturer)
                        .padding(.bottom, 20)
                    }
                }
                
                
            }
            else {
                Text("Loading...")
            }
            Spacer()
            
        }
        .onAppear {
            if let storedResponseData = UserDefaults.standard.value(forKey: "group_id") as? Int {
                let groupIdString = String(storedResponseData)
                networkManager.fetchSchedule(groupId: groupIdString, startDate: "2024.09.01", endDate: "2024.12.31")
            }
            
            
        }
        

    }
        
}

#Preview {
    ScheduleView()
}
