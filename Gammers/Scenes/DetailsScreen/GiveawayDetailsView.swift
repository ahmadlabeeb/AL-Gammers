//
//  GivawayDetailsView.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 12/06/2024.
//

import SwiftUI

struct GiveawayDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.openURL) var openURL
    
    @ObservedObject var viewModel: GiveawayDetailsViewModel
    
    var body: some View {
        VStack(spacing: 0){
            drawUpperView()
            drawMiddleView()
            titledView(title: "Platforms", desc: viewModel.item.platforms)
                .frame(height: 90)
            titledView(title: "Giveaway End Date", desc: viewModel.formatted(dateString: viewModel.item.endDate))
                .frame(height: 90)
            titledView(title: "Description", desc: viewModel.item.description)
        }
        .toolbar(.hidden, for: ToolbarPlacement.navigationBar)
        .edgesIgnoringSafeArea(.all)
    }
    
    func titledView(title: String, desc: String) -> some View{
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Text(desc)
                .font(.body)
                .lineLimit(4)
                .frame(maxWidth: .infinity,maxHeight: .infinity,  alignment: .topLeading)
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
    
    func drawMiddleView() -> some View {
        HStack {
            infoView(iconName: "dollarsign.circle.fill", text: viewModel.item.worth)
                    Divider()
                .frame(width: 1,height: 50)
                .background(Color.gray.opacity(0.5))
            infoView(iconName: "person.2.fill", text: "\(viewModel.item.users)")
                    Divider()
                .frame(width: 1,height: 50)
                .background(Color.gray.opacity(0.5))
            infoView(iconName: "gamecontroller.fill", text: viewModel.item.type)
                }
                .padding()
                .frame(maxWidth: .infinity)
    }
    
    func infoView(iconName: String, text: String) -> some View {
        VStack {
                   Image(systemName: iconName)
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                       .frame(width: 24, height: 24)
                       .foregroundColor(.black)
                   Text(text)
                       .foregroundColor(.black)
                       .font(.body)
               }
               .frame(maxWidth: .infinity)
    }
    
    func drawUpperView() -> some View {
        ZStack {
            AsyncImage(url: URL(string: viewModel.item.image)) { image in
                image
                    .resizable()
                    .imageScale(.medium)
                    
            } placeholder: {
                Color.gray // Placeholder color
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
            
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                    }
                    Spacer()
                    Button(action: {
                        // Action for favorite button
                    }) {
                        Image(systemName: "heart")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                    }
                }
                .padding()
                
                Spacer()
                
                HStack {
                    Text(viewModel.item.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        if let url = URL(string: viewModel.item.openGiveawayURL){
                            openURL(url)
                        }
                    }) {
                        Text("Get it")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .background(
                    Color.black
                        .opacity(0.2)
                        
                        
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, 20)
        }
        
        .frame(width: UIScreen.main.bounds.width)
        .aspectRatio(1/1, contentMode: .fill)
        
        
        //.edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    GiveawayDetailsView(viewModel: GiveawayDetailsViewModel(item: GiveawayEntityModel(
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
    )
    )
    )
}
