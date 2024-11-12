//
//  Register.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/11/24.
//

import SwiftUI

struct Register: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isChecked = false
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
            VStack(spacing: 20){
                VStack{
                    HStack {
                        Spacer()
                        Button(action: {
                        }, label: {
                            Text("Skip")
                                .foregroundStyle(.indigo)
                        })
                    }
                    Image("register")
                        .resizable()
                        .frame(height: 200)
                }
                
                HStack{
                    Text("Create your account")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                    Spacer()
                }
                
                VStack(alignment: .leading){
                    signUpTextField(icon: "person.fill", textLabel: "Username", textValue: $username)
                    signUpTextField(icon: "envelope.fill", textLabel: "Email", textValue: $email)
                    signUpTextField(icon: "lock.fill", textLabel: "Password", textValue: $password)
                    signUpTextField(icon: "lock.fill", textLabel: "Confirm Password", textValue: $confirmPassword)
                    
                    HStack() {
                        Button(action: {
                            isChecked.toggle()
                        }, label: {
                            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                                .tint(.gray)
                            Text("I agree with ")
                                .foregroundColor(.gray) +
                            Text("Privacy")
                                .foregroundColor(.indigo) +
                            Text(" and ")
                                .foregroundColor(.gray) +
                            Text("Policy")
                                .foregroundColor(.indigo)
                        })
                        .padding(.leading, 11)
                    }
                    
                }
                
                
                Button(action: {
                    print("Test")
                }, label: {
                    HStack{
                        Spacer()
                        Text("Sign Up")
                            .foregroundStyle(.white)
                            .padding(10)
                            .frame(height: 35)
                        Spacer()
                    }
                    .padding(10)
                    .background(.indigo)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                })
                
                Text("Or continue with")
                    .foregroundStyle(.gray)
                
                HStack(spacing: 40){
                    bottomButtonView(logo: "google")
                    bottomButtonView(logo: "facebook")
                    bottomButtonView(logo: "apple")
                }
                
                HStack(){
                    Text("Already have an account?")
                        .foregroundStyle(.gray)
                    ZStack(){
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Sign In")
                                .foregroundStyle(.gray)
                                .padding(8)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        })
                        .padding(1)
                        .background(.indigo)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
            }
            .padding(.horizontal, 10)
    }
}

struct signUpTextField: View {
    let icon: String
    let textLabel: String
    @Binding var textValue: String
    @State private var isPasswordVisible = false
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.gray)
            Spacer()
            if textLabel == "Password" || textLabel == "Confirm Password" {
                if isPasswordVisible {
                    TextField(textLabel, text: $textValue)
                        .foregroundStyle(.gray)
                } else {
                    SecureField(textLabel, text: $textValue)
                        .foregroundStyle(.gray)
                }
                
                Button(action: {
                    isPasswordVisible.toggle()
                }, label: {
                    Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                        .foregroundStyle(.gray)
                })
                
            } else {
                TextField(textLabel, text: $textValue)
                    .foregroundStyle(.gray)
            }
        }
        .padding(10)
        .background(.indigo.opacity(0.25))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct bottomButtonView: View {
    let logo: String
    
    var body: some View {
        ZStack(){
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
    Register()
}
