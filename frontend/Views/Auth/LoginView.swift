//
//  LoginView.swift
//  frontend
//
//  Created by Анастасия Гусак on 11.10.2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var authManager = AuthNetworkManager()
    
    @Binding var flag: Bool;
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            Image("logoIcon")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            TextInputComponentView(iconName: "userIcon", title: "Username", value: $username)
            TextInputComponentView(iconName: "passwordIcon", title: "Password", value: $password)
            Button(action: {
                Task {
                        let result = await authManager.login(username: username, password: password)
                        print(result.responseData)
                        if result.isLoggedIn {
                            
                            UserDefaults.standard.set(username, forKey: "username")
                            UserDefaults.standard.set(password, forKey: "password")
                            UserDefaults.standard.set(result.responseData, forKey: "group_id")
                            
                            flag = true
                        }
                    }
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .font(.custom("Inter-Regular_Bold", size: 16))
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color("AccentColor"))
            }
            .cornerRadius(8)
            .padding(.horizontal, 40)
            .padding(.top, 20)
            Spacer()
            
        }
    }
}

//#Preview {
//    LoginView()
//}
