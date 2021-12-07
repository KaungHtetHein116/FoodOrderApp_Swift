//
//  ChefCollectionViewCell.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 11/27/21.
//

import UIKit

class ChefCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "ChefCollectionViewCell"

    @IBOutlet var dishImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var caloryLabel: UILabel!
    
    func setup (dish: Dish) {
        dishImageView.kf.setImage(with: dish.image.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloryLabel.text = dish.formattedCalory
    }
    
}
