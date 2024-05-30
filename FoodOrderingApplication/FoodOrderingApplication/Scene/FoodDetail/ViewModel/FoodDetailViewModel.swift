//
//  FoodDetailViewModel.swift
//  FoodOrderingApplication
//
//  Created by Oğulcan Deniz İnaç on 30.05.2024.
//

import Foundation
import Alamofire

class FoodDetailViewModel {
    
    var cartItems: [FoodsCart] = []
    var totalPrice: Int = 0

    var onDataUpdate: (() -> Void)?
    
    var delegate: FoodListDetailViewModelDelegate!
    var allFoods = [Foods]()
    var food: Foods?

    
    func didLoad() {
        showCart()
    }
    func updateCartData(foodsCart: [FoodsCart], totalPrice: Int) {
            self.cartItems = foodsCart
            self.totalPrice = totalPrice

            onDataUpdate?()
        }
    
    
    func addCart() {

//        FoodListManager.shared.addToCart(yemek_adi: "Ayrxan", yemek_resim_adi: "ayrxan.png", yemek_fiyat: 2, yemek_siparis_adet: 2, kullanici_adi: "mali") { result in
//        }
    }
    
    func deleteItemFromCart() {            

//        FoodListManager.shared.removeFromCart(sepetYemekID:213213 , kullaniciAdi: "mali") { result in
//        }
    }
    
    func showCart() {
        FoodListManager.shared.showCart(kullaniciAdi: "mali") { result in
           
        }
    }
    
    
}


protocol FoodListDetailViewModelDelegate {
    func show(foods: [Foods])
}
