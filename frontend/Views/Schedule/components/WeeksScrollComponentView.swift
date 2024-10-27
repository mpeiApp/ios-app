//
//  WeeksScrollComponentView.swift
//  frontend
//
//  Created by Ivan Frolov on 21.10.2024.
//

import SwiftUI

struct WeeksScrollComponentView: View {
    
    let weeks: [[Date]]
    @Binding var activeIndex: Int
    @Binding  var currentPage: Int
    
    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(weeks.indices, id: \.self) { weekIndex in
                WeekComponentView(week: weeks[weekIndex], weekStartIndex: weekIndex * 7, activeIndex: $activeIndex)
                    .tag(weekIndex)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 80)
        .onChange(of: currentPage) { oldValue, newPage in
            let dayInCurrentWeek = activeIndex % 7
            activeIndex = newPage * 7 + dayInCurrentWeek
        }
    }
}

//
//#Preview {
//    WeeksScrollComponentView()
//}
