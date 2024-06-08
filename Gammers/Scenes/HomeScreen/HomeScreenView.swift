//
//  HomeScreenView.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 08/06/2024.
//

import SwiftUI
import Moya

struct HomeScreenView: View {
    
    static func getInstance() -> HomeScreenView {
        return HomeScreenView(viewModel: HomeScreenViewModel(repo: HomeScreenRepo(networkManger: NetworkManager<GiveawayEndpoint>(provider: MoyaProvider<GiveawayEndpoint>()))))
    }
    
    let viewModel: HomeScreenViewModel
    init(viewModel: HomeScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear(perform: {
                viewModel.getAllGiveaways()
            })
    }
}

#Preview {
    HomeScreenView(viewModel: HomeScreenViewModel(repo: HomeScreenRepo(networkManger: NetworkManager<GiveawayEndpoint>(provider: MoyaProvider<GiveawayEndpoint>()))))
}
