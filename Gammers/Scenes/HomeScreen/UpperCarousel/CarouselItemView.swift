//
//  CarouselItemView.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 09/06/2024.
//

import SwiftUI

struct CarouselItemView: View {
    let item: GiveawayEntityModel

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: item.thumbnail)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    case .success(let image):
                        image
                            .resizable()
                            .imageScale(.large)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .clipped()
                    case .failure:
                        Rectangle()
                            .fill(Color.gray)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding([.leading, .top, .trailing])
                    Text(item.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding([.leading, .bottom, .trailing])
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.7))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .cornerRadius(10)
    }
}

#Preview {
    CarouselItemView(item: GiveawayEntityModel(
        id: 2870,
        title: "Marvel's Midnight Suns (Epic Games) Giveaway",
        worth: "$59.99",
        thumbnail: "https://www.gamerpower.com/offers/1/6661d06ae65fa.jpg",
        image: "https://www.gamerpower.com/offers/1b/6661d06ae65fa.jpg",
        description: "Ever dreamed of fighting alongside iconic Marvel heroes? Now's your chance! Get Marvel's Midnight Suns for free today on the Epic Games Store! Marvel's Midnight Suns is a tactical RPG from Firaxis, the creators of the critically-acclaimed tactical game, XCOM. Don´t miss this amazing game!",
        instructions: "1. Click the \"Get Giveaway\" button to visit the giveaway page.\r\n2. Login into your Epic Games Store account.\r\n3. Click the button to add the game to your library",
        openGiveawayURL: "https://www.gamerpower.com/open/marvel-s-midnight-suns-epic-games-giveaway",
        publishedDate: "2024-06-06 11:06:18",
        type: "Game",
        platforms: "PC, Epic Games Store",
        endDate: "2024-06-13 23:59:00",
        users: 4190,
        status: .active,
        gamerPowerURL: "https://www.gamerpower.com/marvel-s-midnight-suns-epic-games-giveaway",
        openGiveaway: "https://www.gamerpower.com/open/marvel-s-midnight-suns-epic-games-giveaway"
      ))
}
