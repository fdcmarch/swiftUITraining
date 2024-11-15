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
                        NavigationLink(destination: UserDetailRepresentableViewController(user: user)
                            .onAppear {
                                print("Navigating to user detail: \(user.name)")
                            }
                            .navigationBarBackButtonHidden(true)) {
                            ListView(userVm: .init(user: user))
                                .padding(.vertical, 7)
                                .foregroundStyle(.black)
                        }
                        .onAppear {
                            if user == dataFetcher.users.last {
                                dataFetcher.fetch()
                            }
                        }
                    }
                } else {
                    LazyVGrid(columns: gridItems) {
                        ForEach(dataFetcher.users) { user in
                            NavigationLink(destination: UserDetailRepresentableViewController(user: user)
                                .onAppear {
                                    print("Navigating to user detail: \(user.name)")
                                }
                                .navigationBarBackButtonHidden(true)) {
                                GridView(userVm: .init(user: user))
                                    .foregroundStyle(.black)
                                    .frame(width: 200, height: 200)
                                    .background(.gray.opacity(0.1))
                            }
                        }
                    }
                }
                
                GeometryReader { geometry in
                    Color.clear
                        .onChange(of: geometry.frame(in: .global).maxY) { value in
                            let screenHeight = UIScreen.main.bounds.height
                            if value < screenHeight {
                                if !dataFetcher.isLoading {
                                    dataFetcher.fetch(isRefreshing: false)
                                }
                            }
                        }
                }
            }
            .refreshable {
                dataFetcher.fetch(isRefreshing: true)
            }
            .onAppear {
                if dataFetcher.users.isEmpty {
                    dataFetcher.fetch(isRefreshing: true)
                }
            }
        }
    }
}

#Preview {
    UserList()
}
