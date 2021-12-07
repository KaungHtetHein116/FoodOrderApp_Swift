//
//  String+Extension.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 11/18/21.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
