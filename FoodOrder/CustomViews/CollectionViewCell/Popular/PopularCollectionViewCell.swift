//
//  PopularCollectionViewCell.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 11/19/21.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "PopularCollectionViewCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dishImage: UIImageView!
    @IBOutlet var caloryLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func setup (dish: Dish) {
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloryLabel.text = dish.formattedCalory
        dishImage.kf.setImage(with: dish.image.asUrl)
    }
}
