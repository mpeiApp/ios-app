//
//  HomeView.swift
//  frontend
//
//  Created by Анастасия Гусак on 11.10.2024.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("dropDownIcon")
            Text("Hello, world!")
                .font(.custom("Inter-Regular_Bold", size: 20))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
