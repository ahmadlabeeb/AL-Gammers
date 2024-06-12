//
//  GiveawayDetailsViewModel.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 12/06/2024.
//

import Foundation
import Combine

class GiveawayDetailsViewModel: ObservableObject {
    
    
    private var subscription = [AnyCancellable]()
    let item: GiveawayEntityModel
    
    init(item: GiveawayEntityModel) {
        self.item = item
    }
    
    func formatted(dateString: String) -> String {
        return dateString.convertDateString(fromFormat: "yyyy-MM-dd HH:mm:ss", toFormat: "dd-MM-yyyy")
    }
    
}
