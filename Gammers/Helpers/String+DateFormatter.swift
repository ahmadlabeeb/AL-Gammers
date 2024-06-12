//
//  String+DateFormatter.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 12/06/2024.
//

import Foundation

extension String {
    func convertDateString(fromFormat currentFormat: String, toFormat desiredFormat: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = currentFormat
        
        guard let date = inputFormatter.date(from: self) else {
            return self
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = desiredFormat
        
        return outputFormatter.string(from: date)
    }
}
