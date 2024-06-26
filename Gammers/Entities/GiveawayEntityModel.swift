//
//  GiveawayEntityModel.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 08/06/2024.
//

import Foundation

struct GiveawayEntityModel: Codable, Identifiable {
    let id: Int
    let title, worth: String
    let thumbnail, image: String
    let description, instructions: String
    let openGiveawayURL: String
    let publishedDate: String
    let type: String
    let platforms, endDate: String
    let users: Int
    let status: Status
    let gamerPowerURL, openGiveaway: String
    var isFavorite: Bool = false

    enum CodingKeys: String, CodingKey {
        case id, title, worth, thumbnail, image, description, instructions
        case openGiveawayURL = "open_giveaway_url"
        case publishedDate = "published_date"
        case type, platforms
        case endDate = "end_date"
        case users, status
        case gamerPowerURL = "gamerpower_url"
        case openGiveaway = "open_giveaway"
    }
}

enum Status: String, Codable {
    case active = "Active"
}

