//
//  Order.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 11/30/21.
//

import Foundation

struct Order: Decodable {
    let id, name: String
    let dish: Dish
}
