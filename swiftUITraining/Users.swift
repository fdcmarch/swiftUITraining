//
//  Users.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/12/24.
//

import Foundation

struct UserResponse: Decodable {
    var users: [User]
    let total: Int
    let skip: Int
    let limit: Int
}

struct User: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let company: String
    let username: String 
    let email: String
    let address: String
    let zip: String
    let state: String
    let country: String
    let phone: String
    let photo: String
}

