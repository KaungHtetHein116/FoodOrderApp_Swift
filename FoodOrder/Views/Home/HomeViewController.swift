//
//  HomeViewController.swift
//  FoodOrder
//
//  Created by Kaung Htet Hein on 11/18/21.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    @IBOutlet var categoryCollectionView: UICollectionView!
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var chefCollectionView: UICollectionView!
    
    var photo: String = "https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
    var category: [DishCategory] = []
    var populars: [Dish] = []
    var chef: [Dish] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProgressHUD.show()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        chefCollectionView.dataSource = self
        chefCollectionView.delegate = self
        
        registerCells()
        
        NetworkService.shared.fetchAllCategories { [weak self] (result) in
            switch result {
            case .success(let allDishes):
                
                print("all dishes", allDishes)
                
                self?.category = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.chef = allDishes.populars ?? []
                
                self?.categoryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.chefCollectionView.reloadData()
                
                ProgressHUD.dismiss()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    
    
    private func registerCells () {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: PopularCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        
        chefCollectionView.register(UINib(nibName: ChefCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ChefCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoryCollectionView:
            return category.count
            
        case popularCollectionView:
            return populars.count
            
        case chefCollectionView:
            return chef.count 
            
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            
            cell.setup(category: category[indexPath.row])
            
            return cell
            
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as! PopularCollectionViewCell
            
            cell.setup(dish: populars[indexPath.row])
            
            return cell
            
        case chefCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChefCollectionViewCell.identifier, for: indexPath) as! ChefCollectionViewCell
            
            cell.setup(dish: chef[indexPath.row])
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = LishDishesViewController.instantiate()
            
            controller.category = category[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : chef[indexPath.row]
            
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
}
