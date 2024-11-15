//
//  NetworkManager.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/12/24.
//

import Foundation

class DataFetcher: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    private var page = 1
    
    func fetch(isRefreshing: Bool = false) {
        
        guard !isLoading else { return }
                isLoading = true
        
        guard let url = URL(string: "https://fake-json-api.mock.beeceptor.com/users") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response")
                return
            }

            guard let data else {
                print("No data received")
                return
            }
            
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                //self.users.append(contentsOf: users)
                DispatchQueue.main.async {
                    if isRefreshing {
                        self.users = users
                    } else {
                        self.users.append(contentsOf: users) 
                    }
                    self.isLoading = false
                    self.page += 1
                }
                
            } catch let decodingError {
                print("Decoding error: \(decodingError.localizedDescription)")
            }
        }
        task.resume()
    }
}
