//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Omolemo Mashigo on 2025/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var email = ""
    @State private var username = ""
    
    var body: some View {
        Form{
            Section("details"){
                TextField("username", text: $username)
                TextField("email", text: $email)
            }
            
            Section("details"){
                Button("create account"){
                    print("creating account")
                }
            }
            .disabled(username.isEmpty || email.isEmpty)
        }
    }
}

#Preview {
    ContentView()
}
