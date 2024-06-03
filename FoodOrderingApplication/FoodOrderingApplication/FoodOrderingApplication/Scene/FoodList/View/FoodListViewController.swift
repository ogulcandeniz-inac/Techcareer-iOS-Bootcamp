//
//  FoodListViewController.swift
//  FoodOrderingApplication
//
//  Created by Oğulcan Deniz İnaç on 30.05.2024.
//

import UIKit

class FoodListViewController: UIViewController {
 
    @IBOutlet weak var foodListCollectionView: UICollectionView!

    let viewModel = FoodListViewModel()
    var cellWidth: CGFloat = 0
    var cellHeight: CGFloat = 0
    var spacing: CGFloat = 12
    var numberOfColumn: CGFloat = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        viewModel.getFoods()
    }

}

extension FoodListViewController: FoodListViewModelDelegate {
    func show(foods: [Foods]) {
        DispatchQueue.main.async {
            self.foodListCollectionView.reloadData()
        }
    }
    
    private func setupDelegates(){
        viewModel.delegate = self
        foodListCollectionView.delegate = self
        foodListCollectionView.dataSource = self
        foodListCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}
