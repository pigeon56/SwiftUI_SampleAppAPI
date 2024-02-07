//
//  ViewModel.swift
//  SampleAppAPI
//
//  Created by Cindy Michalowski on 2/5/24.
//

import Foundation
import SwiftUI

struct Course: Hashable, Codable {
    let name: String
    let image: String
}

class ViewModel: ObservableObject {
    @Published var courses: [Course] = []
    
    func fetch() {
        
        var baseURLString: String {
            if StartupUtils.shouldRunLocal() {
                return "http://localhost:9999/3/course/popular"
            } else {
                return "https://iosacademy.io/api/v1/courses/index.php"
            }
        }
        
        guard let url = URL(string: baseURLString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            // Convert to JSON
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
