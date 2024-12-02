//
//  utils.swift
//  frontend
//
//  Created by Ivan Frolov on 24.10.2024.
//

import Foundation

func getMonday(day: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    guard let dateFirst = dateFormatter.date(from: day) else {
        print("Не удалось преобразовать строку в дату")
        return Date()
    }
    
    let calendar = Calendar.current
    let weekday = calendar.component(.weekday, from: dateFirst)
    let daysToMonday = (weekday == 1) ? -6 : (2 - weekday)
    
    guard let monday = calendar.date(byAdding: .day, value: daysToMonday, to: dateFirst) else {
        return Date()
    }
    return monday
}


func getWeekSemester(monday: Date) -> [Date] {
    let calendar = Calendar.current
    var weekDays: [Date] = []
        for i in 0..<7 {
            if let day = calendar.date(byAdding: .day, value: i, to: monday) {
                weekDays.append(day)
            }
        }
    return weekDays
}

func getWeeksSemester(firstMonday: Date, lastMonday: Date) -> [[Date]] {
    let calendar = Calendar.current
    var result: [[Date]] = [[]]
    var currentMonday = firstMonday;
    var i = 0;
    while (currentMonday <= lastMonday) {
        let currentWeek = getWeekSemester(monday: currentMonday)
        if (result[0].count == 0) {
            result[0] = currentWeek
        }
        else {
            result.append(currentWeek)
        }
        
        guard let newMonday = calendar.date(byAdding: .day, value: 7, to: currentMonday) else {
            return [[]]
        }
        currentMonday = newMonday
        i += 1
    }
    
    return result
}

func parseDate(date: Date) -> (String, String, String) {
    let dateFormatter = DateFormatter()

    dateFormatter.dateFormat = "E"
    let dayOfWeek = dateFormatter.string(from: date)
    
    dateFormatter.dateFormat = "d"
    let day = dateFormatter.string(from: date)
    
    dateFormatter.dateFormat = "MMM"
    let month = dateFormatter.string(from: date)
    
    let daysOfWeekInRussian = ["Mon": "Пн", "Tue": "Вт", "Wed": "Ср", "Thu": "Чт", "Fri": "Пт", "Sat": "Сб", "Sun": "Вс"]
    let dayOfWeekInRussian = daysOfWeekInRussian[dayOfWeek] ?? dayOfWeek
    
    let monthsInRussian = ["Jan": "Янв", "Feb": "Фев", "Mar": "Март", "Apr": "Апр", "May": "Май", "Jun": "Июнь", "Jul": "Июль", "Aug": "Авг", "Sep": "Сент", "Oct": "Окт", "Nov": "Нояб", "Dec": "Дек"]
    let monthInRussian = monthsInRussian[month] ?? month
    
    return (dayOfWeekInRussian, day, monthInRussian)
}


func formatDateToString(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd" // Формат даты
    return formatter.string(from: date)
}
