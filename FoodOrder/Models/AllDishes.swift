//
//  AllDishes.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 12/4/21.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
