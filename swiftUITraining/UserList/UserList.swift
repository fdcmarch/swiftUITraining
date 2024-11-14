//
//  UserList.swift
//  swiftUITraining
//
//  Created by FDC-CrisMarch on 11/14/24.
//

import SwiftUI

struct UserList: View {
    @State private var selectedTab = 0
    @StateObject var dataFetcher = DataFetcher()
    
    let gridItems: [GridItem] = [
        GridItem(.fixed(200)),
        GridItem(.fixed(200))
    ]
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedTab = 0
                        }
                    }, label: {
                        Text("List")
                            .padding()
                            .foregroundColor(selectedTab == 0 ? .blue : .gray)
                            .font(.headline)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            selectedTab = 1
                        }
                    }, label: {
                        Text("Grid")
                            .padding()
                            .foregroundColor(selectedTab == 1 ? .blue : .gray)
                            .font(.headline)
                    })
                    
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .shadow(radius: 5)
            }
            
            ScrollView {
                if selectedTab == 0 {
                    ForEach(dataFetcher.users) { user in
                        NavigationLink(destination: {
                            UserDetails(userVm: .init(user: user))
                            
                        }, label: {
                            ListView(userVm: .init(user: user))
                                .padding(.vertical, 7)
                                .foregroundStyle(.black)
                        })
                    }
                } else {
                    LazyVGrid(columns: gridItems, content: {
                        ForEach(dataFetcher.users) { user in
                            NavigationLink(destination: {
                                UserDetails(userVm: .init(user: user))
                            }, label: {
                                GridView(userVm: .init(user: user))
                                    .foregroundStyle(.black)
                                    .frame(width: 200, height: 200)
                                    .background(.gray.opacity(0.1))
                            })
                        }
                    })
                }
            }
            .refreshable {
                dataFetcher.fetch(isRefreshing: true)
            }
            .onAppear{
                if dataFetcher.users.isEmpty {
                    dataFetcher.fetch(isRefreshing: true)
                }
            }
            
            .navigationTitle("User List")
        }
    }
}

#Preview {
    UserList()
}
