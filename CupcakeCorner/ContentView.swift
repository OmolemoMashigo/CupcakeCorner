//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Omolemo Mashigo on 2025/04/23.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){ phase in
            if let image = phase.image{
                image
                    .resizable()
                    .scaledToFit()
            }
            else if phase.error == nil{
                Text("THERE WAS AN ERROR LOADING THE IMAGE")
            }else{
                ProgressView()
            }
            
        }
        .frame(width: 200, height: 200)
    }
}

#Preview {
    ContentView()
}
