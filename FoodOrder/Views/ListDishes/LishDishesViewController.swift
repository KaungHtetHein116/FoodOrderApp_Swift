//
//  LishDishesViewController.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 11/30/21.
//

import UIKit
import ProgressHUD

class LishDishesViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var dishes: [Dish] = []
    var category: DishCategory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = category.title
        registerCells()
        
        ProgressHUD.show()
        NetworkService.shared.fetchCategoryDishes(categoryId: category.id) { [weak self](result) in
            switch result {
            case .success(let dishes):
                ProgressHUD.dismiss()
                self?.dishes = dishes
                self?.tableView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
    }
    
    func registerCells(){
        tableView.register(UINib(nibName: DishListableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListableViewCell.identifier)
    }
    
}

extension LishDishesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: DishListableViewCell.identifier) as! DishListableViewCell
        
        cell.setup(dish: dishes[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
