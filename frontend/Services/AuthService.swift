//
//  AuthService.swift
//  frontend
//
//  Created by Анастасия Гусак on 11.10.2024.
//

import Foundation

class AuthNetworkManager: ObservableObject {
    @Published var isLoggedIn = false
    @Published var authMessage: String = ""
    @Published var responseData: Int? = nil

    func login(username: String, password: String) async -> (isLoggedIn: Bool, responseData: Int?, responseMessage: String)  {
        guard let url = URL(string: "http://127.0.0.1:8000/user/login") else {
            print("Invalid URL")
            return (false, nil ,"Invalid URL")
        }

        let body: [String: String] = [
            "username": username,
            "password": password
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: body, options: []) else {
            print("Error converting body to JSON")
            return (false, nil ,"Error converting body to JSON")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
                    
                    if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                        print("Server returned status code: \(httpResponse.statusCode)")
                        return (false, nil, "SERVER ERROR")
                    }

                    let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.isLoggedIn = authResponse.data != nil
                        self.authMessage = authResponse.message
                        self.responseData = authResponse.data
                    }
            
            return (isLoggedIn, responseData, authMessage)
            
            
        }
        catch {
            print("Error: \(error.localizedDescription)")
            return (false, 1,"1")
        }
        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                DispatchQueue.main.async {
//                    self.authMessage = "Request failed: \(error.localizedDescription)"
//                }
//                return
//            }
//
//            guard let data = data else {
//                DispatchQueue.main.async {
//                    self.authMessage = "No data received from the server"
//                }
//                return
//            }
//
//            do {
//                
//                let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
//                DispatchQueue.main.async {
//                    print(1)
//                    self.authMessage = authResponse.message
//                    self.responseData = authResponse.data
//                    self.isLoggedIn = authResponse.message == "OK"
//                }
//            } catch {
//                DispatchQueue.main.async {
//                    self.authMessage = "Failed to parse response: \(error)"
//                }
//            }
//        }
//        
//        task.resume()
    }
}
