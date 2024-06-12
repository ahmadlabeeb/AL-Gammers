//
//  GiveawayListView.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 09/06/2024.
//

import SwiftUI

struct GiveawayListView: View {
    
    let items: [GiveawayEntityModel]
    let selectedCategory: String
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(items.filter{$0.platforms.lowercased().contains(selectedCategory.lowercased()) || selectedCategory == "all"}) { item in
                    NavigationLink {
                        GiveawayDetailsView(viewModel: GiveawayDetailsViewModel(item: item))
                    } label: {
                        GiveawayListItem(item: item)
                            .padding([.leading, .trailing])
                    }

                    
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    GiveawayListView(items: [GiveawayEntityModel(
        id: 2870,
        title: "Marvel's Midnight Suns (Epic Games) Giveaway",
        worth: "$59.99",
        thumbnail: "https://www.gamerpower.com/offers/1/6661d06ae65fa.jpg",
        image: "https://www.gamerpower.com/offers/1b/6661d06ae65fa.jpg",
        description: "Ever dreamed of fighting alongside iconic Marvel heroes? Now's your chance! Get Marvel's Midnight Suns for free today on the Epic Games Store! Marvel's Midnight Suns is a tactical RPG from Firaxis, the creators of the critically-acclaimed tactical game, XCOM. Don´t miss this amazing game!",
        instructions: "1. Click the \"Get Giveaway\" button to visit the giveaway page.\r\n2. Login into your Epic Games Store account.\r\n3. Click the button to add the game to your library",
        openGiveawayURL: "https://www.gamerpower.com/open/marvel-s-midnight-suns-epic-games-giveaway",
        publishedDate: "2024-06-06 11:06:18",
        type: .game,
        platforms: "PC, Epic Games Store",
        endDate: "2024-06-13 23:59:00",
        users: 4190,
        status: .active,
        gamerPowerURL: "https://www.gamerpower.com/marvel-s-midnight-suns-epic-games-giveaway",
        openGiveaway: "https://www.gamerpower.com/open/marvel-s-midnight-suns-epic-games-giveaway"
    )], selectedCategory: "all")
}
