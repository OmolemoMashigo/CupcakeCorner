//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Omolemo Mashigo on 2025/04/24.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    var body: some View {
        Form{
            Section{
                TextField("Name: ", text: $order.name)
                TextField("Street Address: ", text: $order.streetAddress)
                TextField("City: ", text: $order.city)
                TextField("Postal Code: ", text: $order.zip)
            }
            
            Section{
                NavigationLink("Check out"){
                    CheckoutView(order: order)
                }
                .disabled(order.hasValidAddress == false)
            }
        }
    }
}

#Preview {
    AddressView(order: Order())
}
