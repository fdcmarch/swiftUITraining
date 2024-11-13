//
//  Textbook.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/13/24.
//

import SwiftUI

struct Textbook: Identifiable {
    var id = UUID().uuidString
    var textbookName: String
    var textbookCategory: String
    var textbookLessonNumber: String
}
struct TextbookList: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                HeaderView()
                MiddleView()
                
                
            }
            .padding(.horizontal, 10)
            .background(.yellow.opacity(0.2))
        }
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
                    Text("つぎのきょうざいは")
                    Text("これだよ!")
                }
                Image(.panda)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            .padding(20)
        }
    }

struct MiddleView: View {
    var body: some View {
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
        .padding(4)
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("きょうざいをへんこうする")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        })
    }
}
#Preview {
    TextbookList()
}
