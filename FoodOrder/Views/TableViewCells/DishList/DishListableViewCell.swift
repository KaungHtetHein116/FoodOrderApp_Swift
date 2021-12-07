//
//  DishListableViewCell.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 11/30/21.
//

import UIKit

class DishListableViewCell: UITableViewCell {
    
    static let identifier = "DishListableViewCell"

    @IBOutlet var dishImageView: UIImageView!
    @IBOutlet var dishTitleLabel: UILabel!
    @IBOutlet var dishDescriptionLabel: UILabel!
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image.asUrl)
        dishTitleLabel.text = dish.name
        dishDescriptionLabel.text = dish.description
    }

    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish.image.asUrl)
        dishTitleLabel.text = order.dish.name
        dishDescriptionLabel.text = order.name
    }
    
}
