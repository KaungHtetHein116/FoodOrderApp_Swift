//
//  CategoryCollectionViewCell.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 11/18/21.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "CategoryCollectionViewCell"
    
    @IBOutlet var categoryImage: UIImageView!
    @IBOutlet var categoryTitleLabel: UILabel!
    
    func setup (category: DishCategory) {
        categoryTitleLabel.text = category.title
        categoryImage.kf.setImage(with: category.image.asUrl)
    }

}
