//
//  Order.swift
//  CupcakeCorner
//
//  Created by Omolemo Mashigo on 2025/04/24.
//

import Foundation

@Observable
class Order{
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 0
    
    var specialRequest = false{
        didSet{
            if specialRequest == false{
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
}
