//
//  TextbookListComponents.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/13/24.
//

import SwiftUI

struct TextbookListComponents: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
struct HeaderView: View {
        var body: some View {
            HStack(){
                Spacer()
                Text("きょうざい")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.top, 60)
            .padding(.bottom, 20)
            .background(.yellow)
            
            HStack(spacing: 50) {
                VStack (alignment: .leading){
                    Text("つぎのきょうざいは\nこれだよ!")
                        .multilineTextAlignment(.leading)
                }
                Image(.cow)
                    .resizable()
                    .frame(width: 150, height: 120)
            }
            .padding(20)
        }
    }

struct UpperView: View {
    @State private var showAlert = false
    var body: some View {
        //start: upper view
        ZStack{
            HStack (spacing: 10){
                Image(.book1)
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 120)
                VStack (alignment: .leading) {
                    Text("キッズ基本のえいご")
                    Text("レッスン 1")
                    Text("キッズ 基本のえいご")
                }
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(4)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        
        .padding([.leading, .trailing, .top], 2)
        .padding(.bottom, 5)
        .background(.gray.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        
        Button(action: {
            showAlert = true
        }, label: {
            Text("きょうざいをへんこうする")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        })
        AlertNotifView(isPresented: $showAlert)
        // end: upper view
    }
}

struct MiddleView: View {
    @State private var showAlert = false
    var body: some View {
        // start: mid view
        HStack(spacing: 40){
            Button(action: {}, label: {
                Text("きょうざい ")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
            })
            .padding(3)
            .background(.orange.opacity(0.8))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Button(action: {
                showAlert = true
            }, label: {
                Text("コース ")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.orange)
            })
            
            Button(action: {
                showAlert = true
            }, label: {
                Text("おきにいり")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.orange)
            })
            AlertNotifView(isPresented: $showAlert)
            
        }
        .background(.white.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        
        VStack{
            Button(action:  {
                showAlert = true
            }, label: {
                Text("1レベルの目安")
            })
            .padding(.trailing, 20)
            .frame(maxWidth: .infinity, alignment: .trailing)
            AlertNotifView(isPresented: $showAlert)
        }
        // end: mid view
    }
}

struct LevelView: View {
    let level: String
    let color: Color
    var body: some View {
        Text(level)
            .font(.system(size: 10))
            .padding(5)
            .background(color)
    }
}

struct AlertNotifView: View {
    @Binding var isPresented: Bool
    var body: some View {
        Text("")
        .alert(isPresented: $isPresented) {
            Alert(
                title: Text("Alert!!"),
                message: Text("This is still not available."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct TextbookDetailModal: View {
    var textbook: Textbook
    @Binding var isPresented: Textbook?
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = nil
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .padding()
                    }
                }
                .padding(.top, 10) 

                Text("キッズ 基本のえいご")
                    .font(.title)
                    .padding(.top, 20)
                
                Text(textbook.textbookName)
                    .font(.title2)
                    .padding(.bottom, 10)
                
                HStack(spacing: 2) {
                    ZStack {
                        Text("レベル")
                            .font(.system(size: 10))
                            .padding(5)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 2))
                    }
                    .padding(2)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    
                    LevelView(level: "1", color: .orange)
                    LevelView(level: "2", color: .orange)
                    LevelView(level: "3", color: .orange)
                    LevelView(level: "4", color: .orange)
                    LevelView(level: "5", color: .orange)
                    LevelView(level: "6", color: .gray)
                    LevelView(level: "7", color: .gray)
                    LevelView(level: "8", color: .gray)
                    LevelView(level: "9", color: .gray)
                    LevelView(level: "10", color: .gray)
                }
                
                HStack {
                    Spacer()
                    Image(textbook.textbookImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                    Spacer()
                }
                .padding(10)
                .background(.yellow.opacity(0.2))
                .frame(width: 340)
                
                HStack {
                    Text("リズム学習やイラストが豊富に掲載され、 テディ達\n と楽しみながら学習できる、 お子様向けのオリジナ\n ル教材です。")
                        .font(.system(size: 10))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                }
                .padding(.top, 10)
            }
            .padding(.horizontal, 10)
            .background(.yellow.opacity(0.2))
        }
    }
}

//#Preview {
//    LevelView(level: "1", color: .orange)
//    TextbookDetailModal()
//    MiddleView()
//}
