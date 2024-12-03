//
//  GradesService.swift
//  frontend
//
//  Created by Анастасия Гусак on 11.10.2024.
//

import Foundation

class GradesNetworkManager: ObservableObject {
    @Published var gradesData: GradesResponse?
    
    func fetchGrades(username: String) {
        
        if (gradesData != nil) {
            return;
        }
        
        guard let url = URL(string: "http://127.0.0.1:8000/grades/grades?username=\(username)") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data returned")
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(GradesResponse.self, from: data)
                print(decodedResponse)
                DispatchQueue.main.async {
                    self.gradesData = decodedResponse
                }
                print(decodedResponse)
            } catch {
                print("Error decoding data: \(error)")
            }
        }
                        
    task.resume()
    }
}
