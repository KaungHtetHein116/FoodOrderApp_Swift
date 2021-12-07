//
//  UiView+Extension.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 11/18/21.
//

import UIKit

extension UIView {
    
    @IBInspectable  var cornerRadius: CGFloat {
        
        get {
            return self.cornerRadius
            
        }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
}
