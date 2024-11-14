//
//  ContentView.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isChecked = false
    @State private var username = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 30) {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Skip")
                                .foregroundStyle(.indigo)
                        })
                    }
                    Image(.panda)
                        .resizable()
                        .frame(height: 200)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Hello")
                        Text("Welcome Back!")
                    }
                    
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundStyle(.gray)
                        TextField("Username", text: $username)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    .padding(10)
                    .background(.indigo.opacity(0.25))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundStyle(.gray)
                        if isPasswordVisible {
                            TextField("Password", text: $password)
                                .foregroundStyle(.gray)
                        } else {
                            SecureField("Password", text: $password)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                                .foregroundStyle(.gray)
                        }
                        
                    }
                    .padding(10)
                    .background(.indigo.opacity(0.25))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    HStack {
                        Button(action: {
                            isChecked.toggle()
                        }, label: {
                            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                .tint(.gray)
                            Text("Remember me")
                                .foregroundStyle(.gray)
                        })
                        Spacer()
                        
                        NavigationLink(
                            destination: ForgotPassword(),
                            label:{
                                Text("forgot password?")
                                    .foregroundStyle(.indigo)
                                    .fontWeight(.bold)
                        })
                    }
                        .padding(.leading, 20)
                }
                
//                Button(action: {
//                    
//                }, label: {
//                    HStack {
//                        Spacer()
//                        Text("Sign In")
//                            .foregroundStyle(.white)
//                            .frame(height: 40)
//                        Spacer()
//                    }
//                    .padding(10)
//                    .background(.indigo)
//                    .clipShape(RoundedRectangle(cornerRadius: 16))
//                })
                NavigationLink(
                    destination: UserList(),
                    label:{
                        HStack {
                            Spacer()
                            Text("Sign In")
                                .foregroundStyle(.white)
                                .frame(height: 40)
                            Spacer()
                        }
                        .padding(10)
                        .background(.indigo)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                })
                Text("or continue with")
                    .foregroundStyle(.gray)
                   
                HStack(spacing: 30) {
                    BottomButtonView(logo: "apple")
                    BottomButtonView(logo: "facebook")
                    BottomButtonView(logo: "google")
                }
                
                HStack(){
                    Text("Don't have an account?")
                        .foregroundStyle(.gray)
                    ZStack(){
                        NavigationLink(
                            destination: Register(),
                            label:{
                                Text("Sign Up")
                                    .foregroundStyle(.gray)
                                    .padding(8)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                        })
//                        Button(action: {
//                            print("Test")
//                        }, label: {
//                            Text("Sign In")
//                                .foregroundStyle(.gray)
//                                .padding(8)
//                                .background(.white)
//                                .clipShape(RoundedRectangle(cornerRadius: 12))
//                        })
                        .padding(1)
                        .background(.indigo)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                
                
            }
            .padding(.horizontal, 20)
        }
    }
}

struct BottomButtonView: View {
    let logo: String
    var body: some View {
        ZStack {
            Image(logo)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(10)
                .background(.white)
                .clipShape(Circle())
        }
        .padding(2)
        .background(.indigo)
        .clipShape(Circle())
    }
}
#Preview {
    ContentView()
}

