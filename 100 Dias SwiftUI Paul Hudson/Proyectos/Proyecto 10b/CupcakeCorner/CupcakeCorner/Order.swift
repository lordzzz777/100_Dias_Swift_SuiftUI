//
//  Order.swift
//  CupcakeCorner
//
//  Created by Esteban Perez Castillejo on 1/8/24.
//

import Foundation
import Observation

@Observable
class Order: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty  {
            return false
        }else if name == " " || city == " " || zip == " " {
            
        }

        return true
    }
    
    var cost: Decimal {
        // $2 per cake
        var cost = Decimal(quantity) * 2

        // complicated cakes cost more
        cost += Decimal(type) / 2

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }

        return cost
    }
    var extraFrosting = false
    var addSprinkles = false

    
    // Initializer
    init() {
        self.type = 0
        self.quantity = 3
        self.specialRequestEnabled = false
        self.extraFrosting = false
        self.addSprinkles = false
        self.name = UserDefaults.standard.string(forKey: "name") ?? ""
        self.streetAddress = UserDefaults.standard.string(forKey: "streetAddress") ?? ""
        self.city = UserDefaults.standard.string(forKey: "city") ?? ""
        self.zip = UserDefaults.standard.string(forKey: "zip") ?? ""
            
    }
    var name: String {
        didSet{
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
    var streetAddress: String {
        didSet{
            UserDefaults.standard.set(streetAddress, forKey: "streetAddress")
        }
    }
    var city: String {
        didSet{
            UserDefaults.standard.set(city, forKey: "city")
        }
    }
    var zip: String {
        didSet{
            UserDefaults.standard.set(zip, forKey: "zip")
        }
    }
    
    func getSavedAddress() -> [String: String] {
        return [
            "Name": UserDefaults.standard.string(forKey: "name") ?? "",
            "Street Address": UserDefaults.standard.string(forKey: "streetAddress") ?? "",
            "City": UserDefaults.standard.string(forKey: "city") ?? "",
            "Zip": UserDefaults.standard.string(forKey: "zip") ?? ""
        ]
    }
    
    func clearSavedAddress() {
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.removeObject(forKey: "streetAddress")
            UserDefaults.standard.removeObject(forKey: "city")
            UserDefaults.standard.removeObject(forKey: "zip")
            
            // Update published properties
            name = ""
            streetAddress = ""
            city = ""
            zip = ""
        }
}
