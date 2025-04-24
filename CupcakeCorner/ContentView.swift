//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Omolemo Mashigo on 2025/04/23.
//

import SwiftUI

@Observable
class User: Codable{
    enum CodingKeys: String, CodingKey{
        case _name = "name"
    }
    var name = "Taylor"
}

struct ContentView: View {
    
    var body: some View {
        Button("encode Taylor", action: encodeUser)
    }
    
    func encodeUser(){
        let data = try! JSONEncoder().encode(User())
        let string = String(decoding: data, as: UTF8.self)
        print(string)
    }
}

#Preview {
    ContentView()
}
