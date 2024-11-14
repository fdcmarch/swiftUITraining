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
    var textbookImage: String
}

struct TextbookViewModel {
    private let textbook: Textbook
    init(textbook: Textbook) {
        self.textbook = textbook
    }
    
    var textbookName: String { return textbook.textbookName }
    var textbookCategory: String { return textbook.textbookCategory }
    var textbookLessonNumber: String { return textbook.textbookLessonNumber }
    var textbookImage: String { return textbook.textbookImage }
}

struct TextbookListView: View {
    let viewModel: TextbookViewModel
    var body: some View {
        ZStack{
            HStack (spacing: 10){
                Image(viewModel.textbookImage)
                    .resizable()
                    .frame(width: 100, height: 120)
                VStack (alignment: .leading) {
                    Text(viewModel.textbookName)
                    
                    //start: level
                    HStack(spacing: 2){
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
                    //end: level
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
    }
}

struct TextbookList: View {
    @State var textbooks: [Textbook] = {
            return [
                Textbook(textbookName: "Kids UI Part 1", textbookCategory: "Kids", textbookLessonNumber: "1", textbookImage: "book1"),
                Textbook(textbookName: "Kids UI Part 2", textbookCategory: "Kids", textbookLessonNumber: "2", textbookImage: "chung"),
                Textbook(textbookName: "Kids UI Part 3", textbookCategory: "Kids", textbookLessonNumber: "3", textbookImage: "panda"),
                Textbook(textbookName: "Kids UI Part 4", textbookCategory: "Kids", textbookLessonNumber: "4", textbookImage: "book1"),
                Textbook(textbookName: "Kids UI Part 5", textbookCategory: "Kids", textbookLessonNumber: "5", textbookImage: "chung"),
                Textbook(textbookName: "Kids UI Part 6", textbookCategory: "Kids", textbookLessonNumber: "6", textbookImage: "panda"),
                Textbook(textbookName: "Kids UI Part 7", textbookCategory: "Kids", textbookLessonNumber: "7", textbookImage: "book1")
            ]
    }()
    @State private var selectedTextbook: Textbook? = nil
    @State private var isModalPresented: Bool = false
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack{
            ZStack {
                ScrollView{
                    VStack(spacing: 20){
                        HeaderView()
                        UpperView()
                        MiddleView()
                        
                        ForEach(textbooks) { textbook in
                            TextbookListView(viewModel: .init(textbook: textbook))
                                .onTapGesture {
                                    selectedTextbook = textbook
                                    isModalPresented = true
                                }
                        }
                        
                        VStack{
                            Text("すこしむずかしいきょうざいも\n べんきょうできるよ!")
                                .multilineTextAlignment(.center)
                            
                            Image(.bear)
                                .resizable()
                                .frame(width: 200, height: 200)
                            
                            ZStack{
                                Button(action: {
                                    showAlert = true
                                }, label: {
                                    Text("すべてみる")
                                        .foregroundStyle(.black)
                                        .fontWeight(.bold)
                                        .frame(height: 35)
                                        .padding(10)
                                        .frame(width: 250)
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 25))
                                    
                                })
                                AlertNotifView(isPresented: $showAlert)
                            }
                            .padding(.bottom, 4)
                            .background(.gray.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            
                            
                        }
                    }
                    .padding(.horizontal, 10)
                    .background(.yellow.opacity(0.2))
                }
                .sheet(item: $selectedTextbook, content: { textbook in
                    TextbookDetailModal(textbook: textbook, isPresented: $selectedTextbook)
                })
            }
            .navigationTitle("Textbook List") 
        }
    }
}

#Preview {
    TextbookList()
}
