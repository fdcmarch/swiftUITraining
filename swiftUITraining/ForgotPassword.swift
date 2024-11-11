//
//  ForgotPassword.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/11/24.
//

import SwiftUI

struct ForgotPassword: View {
    @State private var firstDigit: String = ""
    
    var body: some View {
        VStack(spacing: 30){
            VStack{
                Image("forgotpass")
                    .resizable()
                    .frame(height: 230)
            }
            
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text("OTP Verification")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Enter OTP sent to your email ID")
                        .foregroundStyle(.gray)
                }
                Spacer()
            }
            
            HStack(spacing:20){
                Text("")
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                    .background(.indigo.opacity(0.6))
                Text("")
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                    .background(.indigo.opacity(0.6))
                Text("")
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                    .background(.indigo.opacity(0.6))
                Text("")
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                    .background(.indigo.opacity(0.6))
            }
            
            HStack(){
                Text("Didn't recieve OTP? Click on")
                Button(action: {
                    print("Test")
                }, label: {
                    Text("Resend")
                        .foregroundStyle(.indigo)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                })
            }
            .padding(.top, 90)
            
            Button(action: {
                print("Tae")
            }, label: {
                HStack{
                    Spacer()
                    Text("Verify")
                        .foregroundStyle(.white)
                        .padding(10)
                        .frame(height: 35)
                    Spacer()
                }
                .padding(10)
                .background(.indigo)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            })
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    ForgotPassword()
}
