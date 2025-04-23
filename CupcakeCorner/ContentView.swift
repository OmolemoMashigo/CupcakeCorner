//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Omolemo Mashigo on 2025/04/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){ image in
            image
                .resizable()
                .scaledToFit()
        } placeholder:{
            ProgressView()
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    ContentView()
}
