//
//  GiveawayListItem.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 09/06/2024.
//

import SwiftUI

struct GiveawayListItem: View {
    var item: GiveawayEntityModel
    
    let width = UIScreen.main.bounds.width - 30
    
    var body: some View {
        let height = width * 220 / 215
        ZStack(alignment: .topLeading) {
            AsyncImage(url: URL(string: item.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: width,height: height)
                case .success(let image):
                    image
                        .resizable()
                        .imageScale(.medium)
                        .frame(width: width,height: height)
                        .clipped()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black.opacity(0.5))
                        )
                    
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width,height: height)
                        .clipped()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(height: height)
            .cornerRadius(10)
            .overlay(
                VStack(alignment: .leading) {
                    // Spacer()
                    Text(item.title)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    Text(item.platforms)
                        .font(.system(size: 13))
                        .fontWeight(.light)
                        .foregroundColor(.white)
                    Spacer()
                    Text(item.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                    .padding([.top, .bottom, .leading], 10)
                    .padding(.trailing, 40),
                alignment: .bottomLeading
            )
            .overlay(
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            // item.isFavorite.toggle()
                        }) {
                            Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                                .padding(6)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                        }
                    }
                    .padding([.top, .trailing], 10)
                    Spacer()
                }
            )
        }
        .background(Color.gray)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(15)
    }
}

#Preview {
    GiveawayListItem(item: GiveawayEntityModel(
        id: 2870,
        title: "Dauntless - Golden Drake's Eye Bundle Giveaway",
        worth: "Free",
        thumbnail: "https://www.gamerpower.com/offers/1/6661d06ae65fa.jpg",
        image: "https://www.gamerpower.com/offers/1b/66672d014b21f.jpg",
        description: "Score ReX for free on IndieGala! ReX is an indie 2D platformer shooter where you play as a mercenary soldier hired by rex corps.",
        instructions: "1. Visit IndieGala giveaway page.\r\n2. Login into your IndieGala account.\r\n3. Click the button to add the game to your library.",
        openGiveawayURL: "https://www.gamerpower.com/open/rex-indiegala-giveaway",
        publishedDate: "2024-06-06 11:06:18",
        type: "Game",
        platforms: "PC, DRM-Free",
        endDate: "2024-06-13 23:59:00",
        users: 4190,
        status: .active,
        gamerPowerURL: "https://www.gamerpower.com/rex-indiegala-giveaway",
        openGiveaway: "https://www.gamerpower.com/open/rex-indiegala-giveaway",
        isFavorite: false
    ))
}
