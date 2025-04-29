//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Omolemo Mashigo on 2025/04/23.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    
    @Bindable private var order = Order()
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("select your flavour", selection: $order.type){
                        ForEach(Order.types.indices, id: \.self){
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("number of cakes \(order.quantity)", value: $order.quantity, in: 0...3)
                }
                
                Section{
                    Toggle("add special requests", isOn: $order.specialRequest.animation())
                    
                    if order.specialRequest{
                        Toggle("add extra frosting", isOn: $order.extraFrosting.animation())
                        Toggle("add extra sprinkles", isOn: $order.addSprinkles.animation())
                    }
                }
                
                Section{
                    NavigationLink("Delivery details"){
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
    

}

#Preview {
    ContentView()
}
