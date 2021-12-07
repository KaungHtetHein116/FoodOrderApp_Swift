//
//  ListOrdersViewController.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 11/30/21.
//

import UIKit
import ProgressHUD

class ListOrdersViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
        
    var orders: [Order] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Orders"
        registerCells()
        
        ProgressHUD.show()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        NetworkService.shared.fetchOrders { [weak self] (result) in
            switch result {
            case .success(let orders):
                ProgressHUD.dismiss()
                
                self?.orders = orders
                self?.tableView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    func registerCells () {
        tableView.register(UINib(nibName: DishListableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListableViewCell.identifier)
    }
    
}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListableViewCell.identifier) as! DishListableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
}
