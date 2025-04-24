//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Omolemo Mashigo on 2025/04/23.
//

import SwiftUI
struct ContentView: View {
    
    @State private var counter = 0
    var body: some View {
        Button("Tap count \(counter)"){
            counter += 1
        }
        .sensoryFeedback(.impact(flexibility: .soft, intensity: 1), trigger: counter)
    }

}

#Preview {
    ContentView()
}
