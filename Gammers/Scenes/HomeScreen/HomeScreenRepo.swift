//
//  HomeScreenRepo.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 08/06/2024.
//

import Foundation
import Moya
import Combine

class HomeScreenRepo {
    
    let networkManger: NetworkManager<GiveawayEndpoint>
    
    init(networkManger: NetworkManager<GiveawayEndpoint>) {
        self.networkManger = networkManger
    }
    
    func getAllGiveaways() -> Future<[GiveawayEntityModel], Error> {
        return networkManger.requestData(target: .getGiveaways(platform: nil))
    }
    
    func getEpicGamesGiveaways() -> Future<[GiveawayEntityModel], Error> {
        return networkManger.requestData(target: .getGiveaways(platform: "epic-games-store"))
    }
}
