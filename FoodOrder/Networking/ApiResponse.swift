//
//  ApiResponse.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 12/4/21.
//

import Foundation

struct ApiResponse<T:Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
