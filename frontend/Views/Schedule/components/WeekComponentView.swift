//
//  WeekComponentView.swift
//  frontend
//
//  Created by Ivan Frolov on 13.10.2024.
//

import SwiftUI

struct WeekComponentView: View {
    
    let week: [Date]
    let weekStartIndex: Int
    @Binding var activeIndex: Int
    
    var body: some View {

        HStack() {
            ForEach(week.indices, id: \.self) { dayIndex in
                let globalDayIndex = weekStartIndex + dayIndex
                DateComponentView(day: week[dayIndex], isActive: activeIndex == globalDayIndex) {
                    activeIndex = globalDayIndex
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        
    }
}

#Preview {
    @State var activeIndex = 0
        return WeekComponentView(
            week: getWeekSemester(monday: getMonday(day: "2024-12-20")),
            weekStartIndex: 0,
            activeIndex: $activeIndex
        )
}
