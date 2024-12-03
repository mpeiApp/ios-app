//
//  SwiftUIView.swift
//  frontend
//
//  Created by Ivan Frolov on 13.10.2024.
//

import SwiftUI

struct DateComponentView: View {
    
    let day: Date
    let isActive: Bool
    let action: () -> Void
    
    let dayOfWeek: String
    let dayNumber: String
    let month: String
    
    
    private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "E\n d MMM"
            return formatter
        }
    
    init(day: Date, isActive: Bool, action: @escaping () -> Void) {
        self.day = day
        self.isActive = isActive
        self.action = action
        
        let parsedDate = parseDate(date: day)
        self.dayOfWeek = parsedDate.0
        self.dayNumber = parsedDate.1
        self.month = parsedDate.2
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\( dayOfWeek),")
                .font(.custom("Inter-Regular_Bold", size: 12))
                .foregroundStyle(Color(isActive ? "AccentColor" : "secondaryColor"))
                .lineLimit(1)
            Text("\(dayNumber) \(month)")
                .font(.custom("Inter-Regular_Bold", size: 12))
                .padding(.bottom, 10)
                .foregroundStyle(Color(isActive ? "AccentColor" : "secondaryColor"))
                .lineLimit(1)
                .layoutPriority(1)
        }
        .background(
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(Color(isActive ? "AccentColor": "nonActiveColor"))
                .padding(.top, 36)
        )
        .onTapGesture {
            action()
        }
        .frame(minWidth: 40)
    }
}

//#Preview {
//    DateComponentView(dayOfWeek: "ПН", day: 1, month: "Окт", isActive: false)
//}
