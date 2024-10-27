//
//  TableHeaderView.swift
//  frontend
//
//  Created by Анастасия Гусак on 21.10.2024.
//

import Foundation
import SwiftUI

struct TableHeaderView: View {
    var body: some View {
        HStack {
            Text("Название")
                .font(.custom("Inter-Regular_SemiBold", size: 12))
                .foregroundColor(Color("secondaryColor"))
                .frame(minWidth: 180, maxWidth: .infinity, alignment: .leading)
                .layoutPriority(0)

            Text("Вес")
                .font(.custom("Inter-Regular_SemiBold", size: 12))
                .foregroundColor(Color("secondaryColor"))
                .frame(minWidth: 30, maxWidth: 40, alignment: .leading)
                .fixedSize(horizontal: true, vertical: false) // Отключаем растягивание по горизонтали

            Text("Дата")
                .font(.custom("Inter-Regular_SemiBold", size: 12))
                .foregroundColor(Color("secondaryColor"))
                .frame(minWidth: 50, maxWidth: 130, alignment: .leading)
                .layoutPriority(1)

            Text("Оценка")
                .font(.custom("Inter-Regular_SemiBold", size: 12))
                .foregroundColor(Color("secondaryColor"))
                .frame(minWidth: 60, maxWidth: 130, alignment: .leading)
                .layoutPriority(1)
        }
        .padding(.top, 10)
    }
}
