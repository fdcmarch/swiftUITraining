//
//  Users.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/12/24.
//

import Foundation

struct UserResponse: Decodable {
    var users: [User]
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let age: Int
    let image: String
    let address: Address
    let gender: String
    let phone: String
}


struct Address: Codable {
    let address: String
}
