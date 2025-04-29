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
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool{
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty{
            return false
        }
        return true
    }
    
    var cost: Decimal{ //more accurate than Double
        //base cost of $2
        var cost = Decimal(quantity) * 2
        
        cost += Decimal(type)/2
        
        //1$ per cake for extra frosting
        if extraFrosting{
            cost += Decimal(quantity)
        }
        
        //$0.5 per cake for sprinkles
        if addSprinkles{
            cost += Decimal(quantity)/2
        }
        
        return cost
    }
}
