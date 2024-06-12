//
//  HomeScreenView.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 08/06/2024.
//

import SwiftUI
import Moya
import Combine


struct HomeScreenView: View {
    
    static func getInstance() -> HomeScreenView {
        return HomeScreenView(viewModel: HomeScreenViewModel(repo: HomeScreenRepo(networkManger: NetworkManager<GiveawayEndpoint>(provider: MoyaProvider<GiveawayEndpoint>()))))
    }
    @State var selectedCategory = "all"
    @ObservedObject var viewModel: HomeScreenViewModel
    @State var isLoading = true
    init(viewModel: HomeScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.isloading {
                    Text("Loading...")
                }
                else {
                    VStack {
                        UpperCarouselView(items: viewModel.itemsList)
                        
                        filterList()
                        
                        GiveawayListView(items: viewModel.itemsList, selectedCategory: selectedCategory)
                    }
                }
            }
        }
        .onAppear(perform: {
            viewModel.getAllGiveaways()
        })
    }
    
    func filterList() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 5) {
                            ForEach(viewModel.categories, id: \.self) { cat in
                                Button(action: {
                                    selectedCategory = cat
                                }) {
                                    Text(cat)
                                        .padding()
                                        .foregroundColor(selectedCategory == cat ? Color.black : Color.gray)
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 50)
    }
}

#Preview {
    HomeScreenView(viewModel: HomeScreenViewModel(repo: HomeScreenRepo(networkManger: NetworkManager<GiveawayEndpoint>(provider: MoyaProvider<GiveawayEndpoint>()))))
}
