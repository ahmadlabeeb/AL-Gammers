//
//  ContentView.swift
//  Gammers
//
//  Created by Ahmad Labeeb on 07/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(InfoPlistHelper.getValueForKey(key: .baseURL)!)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
