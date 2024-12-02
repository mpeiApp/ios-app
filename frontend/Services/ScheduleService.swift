//
//  ScheduleService.swift
//  frontend
//
//  Created by Анастасия Гусак on 11.10.2024.
//

import Foundation

class ScheduleNetworkManager: ObservableObject {
    @Published var scheduleData: ScheduleResponse?
    
    func fetchSchedule(groupId: String, startDate: String, endDate: String) {
        guard let url = URL(string: "http://127.0.0.1:8000/schedule/by_timestamp?group_id=\(groupId)&start_date=\(startDate)&end_date=\(endDate)") else {
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
                let decodedResponse = try JSONDecoder().decode(ScheduleResponse.self, from: data)
                DispatchQueue.main.async {
                    self.scheduleData = decodedResponse
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        
        task.resume()
    }
}
