//
//  InfoPlistHelper.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 08/06/2024.
//

import Foundation

enum InfoPlistParameters: String {
  case baseURL = "base_url"
  
}

class InfoPlistHelper {
  static func getValueForKey(key: InfoPlistParameters) -> String? {
    if let value = Bundle.main.infoDictionary?[key.rawValue] {
      return value as? String
    }
    return nil
  }
}
