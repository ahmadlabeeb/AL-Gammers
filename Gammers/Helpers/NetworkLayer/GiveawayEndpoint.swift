//
//  EndPoints.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 08/06/2024.
//

import Foundation
import Moya

enum GiveawayEndpoint {
    case getGiveaways(platform: String?)
}

extension GiveawayEndpoint: TargetType {
    var baseURL: URL {
        return URL(string: InfoPlistHelper.getValueForKey(key: .baseURL)!)!
    }
    
    var path: String {
        switch self {
        case .getGiveaways:
            return "/api/giveaways"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getGiveaways:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getGiveaways(let platform):
            var parameters = [String: Any]()
            if let platform = platform {
                parameters["platform"] = platform
            }
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}
