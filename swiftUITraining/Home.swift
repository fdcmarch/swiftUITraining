//
//  Home.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/12/24.
//

import SwiftUI

struct Person: Identifiable {
    let id: UUID = UUID()
    let imageName: String
    let name: String
    let status: String
    let address: String
    let rating: String
    let lesson: String
    let coin: String
    let flag: String
    let country: String
    let motto: String
}

struct PersonViewModel {
//    private let person: Person
//    init(person: Person) {
//        self.person = person
//    }
//    var imageName: String { return person.imageName }
//    var name: String { return person.name }
//    var status: String { return person.status }
//    var address: String { return person.address }
//    var rating: String { return person.rating }
//    var lesson: String { return person.lesson }
//    var coin: String { return person.coin }
//    var flag: String { return person.flag }
//    var country: String { return person.country }
//    var motto: String { return person.motto }
    private let user: User

       init(user: User) {
           self.user = user
       }

        var imageName: String { return user.image }
        var name: String { return user.firstName + " " + user.lastName }
        var age: String { return String(user.age) }
        var address: String { return user.address.address }
        var gender: String { return String(user.gender) }
        var phone: String { return String(user.phone) }
    
}

struct PersonView: View {
    let viewModel: PersonViewModel
    var body: some View {
        HStack {
                AsyncImage(
                    url: URL(string: viewModel.imageName)) { image in image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 110)
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .tint(.white)
                            .frame(width: 100, height: 110)
                    }
            VStack(alignment: .leading) {
                HStack{
                    Text(viewModel.name)
                        .bold()
                    Text("(Age: " + viewModel.age + ")")
                }
                HStack (spacing: 20){

                    HStack {
                        Image(systemName: "figure.child")
                        Text(viewModel.gender)
                    }
                }
                
                HStack {
                    Image(systemName: "location.circle")
                    Text(viewModel.address)
                }
                
                HStack {
                    Image(systemName: "phone.fill")
                    Text(viewModel.phone)
                }
                
            }
        }
    }
}

struct PersonDetailView: View {
    let viewModel: PersonViewModel
    var body: some View {
        ScrollView{
            VStack (spacing: 20){
                VStack (alignment: .leading){
                    HStack (spacing: 10) {
                        AsyncImage(
                            url: URL(string: viewModel.imageName)) { image in image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 100, height: 110)
                            }
//                        Image(viewModel.imageName)
//                            .resizable()
//                            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        
                        HStack{
                            Text(viewModel.name)
                            Spacer()
                            Image(systemName: "ellipsis")
                        }
                    }
                }
                .padding(3)
                .background(.gray.opacity(0.6))
                
                HStack{
                    AsyncImage(
                        url: URL(string: viewModel.imageName)) { image in image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 200)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 100, height: 110)
                        }
//                    Image(viewModel.imageName)
//                        .resizable()
//                        .frame(width: 200, height: 200)
                        
                    
                    VStack (alignment: .leading, spacing: 10) {
                        
                        HStack {
                            Image(systemName: "birthday.cake.fill")
                            Text(viewModel.age)
                        }
                        HStack{
                            Image(systemName: "figure.child")
                            Text(viewModel.gender)
                        }
                        
                        HStack{
                            Image(systemName: "location.circle")
                            Text(viewModel.address)
                        }
                        
                        HStack{
                            Image(systemName: "phone.fill")
                            Text(viewModel.phone)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Button(
                        action: {
                        }, label: {
                            HStack{
                                Spacer()
                                Text("Lesson Now")
                                    .foregroundStyle(.white)
                                    .padding(10)
                                    .frame(height: 35)
                                Spacer()
                            }
                            .padding(10)
                            .background(.pink.opacity(0.8))
                        })
                    
                    Button(
                        action: {
                        }, label: {
                            HStack{
                                Spacer()
                                Text("View More Photos")
                                    .foregroundStyle(.white)
                                    .padding(10)
                                    .frame(height: 35)
                                Spacer()
                            }
                            .padding(10)
                            .background(.gray.opacity(0.8))
                        })
                    
                }
                
                HStack(spacing: 25){
                    VStack{
                        Image(systemName: "heart")
                        Text("Favorite")
                    }
                    VStack{
                        Image(systemName: "arrow.clockwise")
                        Text("Refresh")
                    }
                    VStack{
                        Image(systemName: "paperplane")
                        Text("Share")
                    }
                    VStack{
                        Image(systemName: "note.text")
                        Text("Keep")
                    }
                }
            }
            .padding(.horizontal, 10)
        }
        .navigationTitle("User Details")
    }
}

struct Home: View {
    @State private var users: [User] = []

    func fetchUsers() {
        NetworkManager.shared.getAllUsersNativeWay { response in
            DispatchQueue.main.async {
                self.users = response ?? []
            }
//            for user in self.users {
//                print("User Image: \(user.image)")
//            }
        }
    }

    var body: some View {
            NavigationStack {
                VStack {
                    List(users) { user in
                        NavigationLink {
                            PersonDetailView(viewModel: .init(user: user))
                        } label: {
                            PersonView(viewModel: .init(user: user))
                        }
                        .foregroundStyle(.white)
                        .listRowBackground(Color.black)
                    }
                    .listStyle(PlainListStyle())
                }
                .navigationTitle("Home")
                .onAppear {
                    fetchUsers()
                }
            }
        }
}


#Preview {
    Home()
}
