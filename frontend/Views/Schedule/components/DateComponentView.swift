//
//  SwiftUIView.swift
//  frontend
//
//  Created by Ivan Frolov on 13.10.2024.
//

import SwiftUI

struct DateComponentView: View {
    
    var dayOfWeek: String
    var day: Int
    var month: String
    var isActive: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Пн,")
                .font(.custom("Inter-Regular_Bold", size: 12))
                .foregroundStyle(Color(isActive ? "AccentColor" : "secondaryColor"))
                .lineLimit(1)
            Text("7 Окт")
                .font(.custom("Inter-Regular_Bold", size: 12))
                .padding(.bottom, 10)
                .foregroundStyle(Color(isActive ? "AccentColor" : "secondaryColor"))
                .lineLimit(1)
        }
        .background(
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(Color(isActive ? "AccentColor": "nonActiveColor"))
                .padding(.top, 36)
        )
    }
}

#Preview {
    DateComponentView(dayOfWeek: "ПН", day: 1, month: "Окт", isActive: false)
}
