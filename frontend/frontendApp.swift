//
//  frontendApp.swift
//  frontend
//
//  Created by Анастасия Гусак on 11.10.2024.
//

import SwiftUI

@main
struct frontendApp: App {
    
    @State private var selectedTab = 0
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                ContentView()
                    .tabItem {
                        VStack {
                            selectedTab == 0 ? Image("homeIconActive") : Image("homeIcon")
                            Text("Главная")
                        }
                    }
                    .tag(0)
                ScheduleView()
                    .tabItem {
                        VStack {
                            selectedTab == 0 ? Image("scheduleIcon") : Image("scheduleIconActive")
                            Text("Расписание")
                        }
                    }
                    .tag(1)
            }
            .accentColor(.accentColor)
            
        }
    }
}
