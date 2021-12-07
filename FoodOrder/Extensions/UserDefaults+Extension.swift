//
//  UserDefaults+Extension.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 12/7/21.
//

import Foundation

extension UserDefaults {
    enum UserDefaultsKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
}
