//
//  HomeScreenViewModel.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 08/06/2024.
//

import Foundation
import Combine

class HomeScreenViewModel {
    
    private let repo: HomeScreenRepo
    private var subscription = [AnyCancellable]()
    
    init(repo: HomeScreenRepo) {
        self.repo = repo
    }
    
    func getAllGiveaways() {
        repo.getAllGiveaways().sink { _ in
            
        } receiveValue: { value in
            print("xxx \(value.count)")
        }
        .store(in: &subscription)

    }
    
}
