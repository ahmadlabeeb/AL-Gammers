//
//  HomeScreenViewModel.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 08/06/2024.
//

import Foundation
import Combine

class HomeScreenViewModel: ObservableObject {
    
    private let repo: HomeScreenRepo
    private var subscription = [AnyCancellable]()
    @Published var itemsList: [GiveawayEntityModel] = [GiveawayEntityModel]()
    @Published var epicItemsList: [GiveawayEntityModel] = [GiveawayEntityModel]()
    @Published var categories: [String] = []
    @Published var allListLoading = false
    @Published var epicsLoading = false
    
    init(repo: HomeScreenRepo) {
        self.repo = repo
    }
    
    func getAllGiveaways() {
        allListLoading = true
        repo.getAllGiveaways().sink {[weak self] _ in
            self?.allListLoading = false
        } receiveValue: {[weak self] value in
            self?.itemsList = value
            self?.categories = self?.getCategoriesFromData(giveaways: value) ?? []
        }
        .store(in: &subscription)

    }
    
    func getEpicGamesGiveaways() {
        epicsLoading = true
        repo.getEpicGamesGiveaways().sink {[weak self] _ in
            self?.epicsLoading = false
        } receiveValue: {[weak self] value in
            self?.epicItemsList = value
        }
        .store(in: &subscription)

    }
    
    func getCategoriesFromData(giveaways: [GiveawayEntityModel]) -> [String] {
        var distinctPlatforms: Set<String> = []
        for giveaway in giveaways {
            let platforms = giveaway.platforms.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            
            distinctPlatforms.formUnion(platforms)
        }
        return Array(["all"] + distinctPlatforms)
    }
    
}
