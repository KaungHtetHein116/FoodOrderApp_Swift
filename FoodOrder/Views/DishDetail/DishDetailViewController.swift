//
//  DishDetailViewController.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 11/27/21.
//

import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {
    @IBOutlet var dishImagView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var caloryLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    
    var dish: Dish!
    
    func populateView() {
        dishImagView.kf.setImage(with: dish.image.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloryLabel.text = dish.formattedCalory
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        populateView()
    }
    
    @IBAction func placeOrderButtonClick(_ sender: Any) {
        guard let name =
            nameTextField.text?.trimmingCharacters(in: .whitespaces), !name.isEmpty else {
            return ProgressHUD.showError("Please enter your name")
        }
        
        ProgressHUD.show("Placing Order ...")
        
        NetworkService.shared.placeOrder(dishId: dish.id, name: name) {[weak self] (result) in
            switch result {
            case .success(let data):
                print("data-----", data)
                ProgressHUD.showSuccess("Placed order")
                
            case .failure(let error):
                ProgressHUD.show(error.localizedDescription)
            }
        }
    }
    
    
}
