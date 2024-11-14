//
//  UserListComponents.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/14/24.
//

import SwiftUI

struct UserListComponents: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct UserListViewModel {
    let user: User
    
    var id: Int {  return user.id }
    var name: String { return user.name }
    var company: String { return user.company }
    var username: String { return user.username }
    var email: String { return user.email }
    var address: String { return user.address }
    var zip: String { return user.zip }
    var state: String { return user.state }
    var country: String { return user.country }
    var phone: String { return user.phone }
    var photo: String { return user.photo }
}

struct ListView: View {
    var userVm: UserListViewModel
    var body: some View {
        HStack(spacing: 20) {
            if let url = URL(string: userVm.photo) {
                AsyncImage(url: url) { image in image
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        .shadow(radius: 5)
                } placeholder: {
                    ProgressView()
                        .frame(width: 80, height: 80)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(userVm.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                Text(userVm.address)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(10)
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 6)
        .padding(.horizontal)

    }
}

struct GridView: View {
    var userVm: UserListViewModel
    var body: some View {
        VStack {
            // Profile Image
            if let url = URL(string: userVm.photo) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100)
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 4)
                        )
                        .shadow(radius: 10)
                } placeholder: {
                    ZStack {
                        Circle()
                            .foregroundColor(Color.gray.opacity(0.3))
                            .frame(width: 100, height: 100)
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .frame(width: 50, height: 50)
                    }
                }
            }
            
            Text(userVm.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.top, 8)
                .lineLimit(1)
            
            
            Text(userVm.address)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(1)
                .truncationMode(.tail)
        }

        .padding()
        .cornerRadius(1)
        .shadow(radius: 10)
        .padding(.horizontal)


    }
}

extension Text {
    func fontStyle1() -> some View {
        self
            .font(.body)
            .foregroundColor(.gray)
    }
}
//#Preview {
//    ListView()
//    GridView()
//}
