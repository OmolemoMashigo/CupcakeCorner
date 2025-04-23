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
    
    var disableForm:Bool{
        username.count == 0 || email.count == 0
    }
    
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
            .disabled(disableForm)
        }
    }
}

#Preview {
    ContentView()
}
