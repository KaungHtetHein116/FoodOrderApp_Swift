//
//  Dish.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 11/19/21.
//

import Foundation

struct Dish: Decodable {
    let id, name, description, image: String
    let calories: Double
    
    var formattedCalory: String {
        return String(format: "%.2f calories", calories)
    }
}
