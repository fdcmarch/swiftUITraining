//
//  Users.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/14/24.
//

import SwiftUI

struct UserDetails: View {
    var userVm: UserListViewModel
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    ZStack(alignment: .bottomLeading) {
                        if let url = URL(string: userVm.photo) {
                            AsyncImage(url: url) { image in image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: .infinity, height: 250)
                                    .clipped()
                            } placeholder: {
                                ZStack {
                                    Image(systemName: "photo.on.rectangle.angled")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: .infinity, height: 250)
                                        .foregroundColor(.gray)
                                    
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                        .scaleEffect(1.5)
                                }
                            }
                        }


                        if let url = URL(string: userVm.photo) {
                            AsyncImage(url: url) { image in image
                                    .resizable()
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .frame(width: 120, height: 120)
                                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                    .shadow(radius: 10)
                            } placeholder: {
                                ZStack {
                                    Image("")
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .frame(width: 120, height: 120)
                                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                        .shadow(radius: 10)
                                    
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                        .scaleEffect(1.5)
                                }
                            }
                            .padding(.leading, 20)
                            .padding(.bottom, 10)
                        }
                    }

                    VStack(alignment: .leading, spacing: 15) {
                        Text("Personal Details")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        HStack {
                            Text("Name:")
                                .fontStyle1()
                            Spacer()
                            Text(userVm.name)
                                .fontStyle1()
                        }
                        
                        HStack {
                            Text("Username:")
                                .fontStyle1()
                            Spacer()
                            Text(userVm.username)
                                .fontStyle1()
                        }
                        
                        HStack {
                            Text("Email:")
                                .fontStyle1()
                            Spacer()
                            Text(userVm.email)
                                .fontStyle1()
                        }
                        
                        HStack {
                            Text("Phone:")
                                .fontStyle1()
                            Spacer()
                            Text(userVm.phone)
                                .fontStyle1()
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)

                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Address Details")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        HStack {
                            Text("Address:")
                                .fontStyle1()
                            Spacer()
                            Text(userVm.address)
                                .fontStyle1()
                        }
                        
                        HStack {
                            Text("Zip:")
                                .fontStyle1()
                            Spacer()
                            Text(userVm.zip)
                                .fontStyle1()
                        }
                        
                        HStack {
                            Text("State:")
                                .fontStyle1()
                            Spacer()
                            Text(userVm.state)
                                .fontStyle1()
                        }
                        HStack {
                            Text("Country:")
                                .fontStyle1()
                            Spacer()
                            Text(userVm.country)
                                .fontStyle1()
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                }
                .padding(10)
            }
    }
}

//#Preview {
//    UserDetails()
//}
