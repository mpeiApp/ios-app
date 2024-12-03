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
    @State private var isLoggedIn: Bool = false
    
    var body: some Scene {
        
        WindowGroup {
            //TODO: DELETE PLUG AND ADD LOGIN VIA LOCAL STORAGE
            if isLoggedIn || UserDefaults.standard.string(forKey: "username") != nil {
                TabView(selection: $selectedTab) {
                    ContentView()
                        .tabItem {
                            VStack {
                                selectedTab == 0 ? Image("homeIconActive") : Image("homeIcon")
                                Text("Главная")
                                    .font(.custom("Inter-Regular_Bold", size: 18))
                            }
                        }
                        .tag(0)
                    ScheduleView()
                        .tabItem {
                            VStack {
                                selectedTab == 1 ? Image("scheduleIconActive") : Image("scheduleIcon")
                                Text("Расписание")
                                    .font(.custom("Inter-Regular_Regular", size: 18))
                            }
                        }
                        .tag(1)
                    GradesView()
                        .tabItem {
                            VStack {
                                selectedTab == 2 ? Image("gradesIconActive") : Image("gradesIcon")
                                Text("Оценки")
                                    .font(.custom("Inter-Regular_Regular", size: 18))
                            }
                        }
                        .tag(2)
                    ProfileView()
                        .tabItem {
                            VStack {
                                selectedTab == 3 ? Image("profileIconActive") : Image("profileIcon")
                                Text("Профиль")
                                    .font(.custom("Inter-Regular_Regular", size: 18))
                            }
                        }
                        .tag(3)
                }
                .accentColor(.accentColor)
            }
            else {
                VStack {
                    LoginView(flag: $isLoggedIn)
                }
            }
            
        }
    }
}
