//
//  FoodListViewModel.swift
//  FoodOrderingApplication
//
//  Created by Oğulcan Deniz İnaç on 30.05.2024.
//

import Foundation
import Alamofire


class FoodListViewModel {

    var delegate: FoodListViewModelDelegate!
    var allFoods = [Foods]()
    var food: Foods?

    
    func getFoods() {

        FoodListManager.shared.getFoods { [weak self] result in
            switch result {
            case .success(let response):
                if let yemekler = response.yemekler {
                    self?.allFoods = yemekler
                    self?.delegate.show(foods: yemekler)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

protocol FoodListViewModelDelegate {
    func show(foods: [Foods])
}
