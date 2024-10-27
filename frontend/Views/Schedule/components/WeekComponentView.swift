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

        HStack(spacing: 10) {
            ForEach(week.indices, id: \.self) { dayIndex in
                let globalDayIndex = weekStartIndex + dayIndex
                DateComponentView(day: week[dayIndex], isActive: activeIndex == globalDayIndex) {
                    activeIndex = globalDayIndex
                }
            }
        }
        .padding()
        
    }
}

//#Preview {
//    WeekComponentView()
//}
