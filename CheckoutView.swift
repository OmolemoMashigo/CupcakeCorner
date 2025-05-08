//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Omolemo Mashigo on 2025/04/29.
//

import SwiftUI

struct CheckoutView: View {
    
    var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    @State private var showingErrorAlert = false
    @State private var errorMessage = ""

    
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url:  URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3){ image in
                    image
                        .resizable()
                        .scaledToFit()
                    
                } placeholder: {
                    ProgressView()
                }.frame(height: 233)
                
                Text("Your total cost is \(order.cost, format: .currency(code: "ZAR"))")
                    .font(.title)
                
                Button("Place Order"){
                    Task{
                        await placeOrder()
                    }
                    
                }.padding()
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you for your order!", isPresented: $showingConfirmation){
            
        }message: {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async{
        guard let encoded = try? JSONEncoder().encode(order) else{
            print("failed to encode order")
            return
        }
        print("check 1")
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        print("check 2")
        do{
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            print("check 3")
            print(encoded.startIndex)
            print(data)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            print("check 4")
            confirmationMessage = "your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way"
            showingConfirmation = true
        }
        catch{
            print("checkout failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
