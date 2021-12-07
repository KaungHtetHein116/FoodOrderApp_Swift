//
//  OnboardingCollectionViewCell.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 11/18/21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "OnboardingCollectionViewCell"
    
    @IBOutlet var slideImage: UIImageView!
    @IBOutlet var slideTitleLable: UILabel!
    @IBOutlet var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        slideImage.image = slide.image
        slideTitleLable.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
    
}
