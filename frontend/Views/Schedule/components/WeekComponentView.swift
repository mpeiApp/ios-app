//
//  WeekComponentView.swift
//  frontend
//
//  Created by Ivan Frolov on 13.10.2024.
//

import SwiftUI

struct WeekComponentView: View {
    
    let currentWeek: [Day] =
    [
        Day(dayOfWeek: "Пн", day: 1, month: "Февраль", isActive: false),
        Day(dayOfWeek: "Вт", day: 2, month: "Февраль", isActive: true),
        Day(dayOfWeek: "Пн", day: 1, month: "Февраль", isActive: false),
        Day(dayOfWeek: "Вт", day: 2, month: "Февраль", isActive: false),
        Day(dayOfWeek: "Пн", day: 1, month: "Февраль", isActive: false),
        Day(dayOfWeek: "Вт", day: 2, month: "Февраль", isActive: false),
        Day(dayOfWeek: "Пн", day: 1, month: "Февраль", isActive: false),
    ]
    var body: some View {

        HStack(spacing: 20) {
            ForEach(currentWeek.indices, id: \.self) { index in
                            DateComponentView(dayOfWeek: currentWeek[index].dayOfWeek, day: currentWeek[index].day, month: currentWeek[index].month, isActive: currentWeek[index].isActive)
                            
                            // Проверка, является ли текущий индекс последним
                            
                        }
        }
        .frame(maxWidth: .infinity)
        .padding()
        
    }
}

#Preview {
    WeekComponentView()
}
