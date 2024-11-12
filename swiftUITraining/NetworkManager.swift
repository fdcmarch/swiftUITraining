//
//  NetworkManager.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/12/24.
//

import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    
    func getAllUsersNativeWay(completion: @escaping ([User]?) -> Void) {
        let urlString = "https://dummyjson.com/users?limit=20"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let userResponse = try decoder.decode(UserResponse.self, from: data)
                completion(userResponse.users)
            } catch {
                print("Error decoding: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }

}
