//
//  FoodCardViewModel.swift
//  FoodOrderingApplication
//
//  Created by Oğulcan Deniz İnaç on 30.05.2024.
//

import Foundation
import Alamofire

class FoodCardViewModel {

    var sepetYemekListesi = [FoodsCart]()

    func showCart(kullaniciAdi: String, completion: @escaping () -> Void) {
        let params: Parameters = ["kullanici_adi": kullaniciAdi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(FoodsCartResponse.self, from: data)
                    if let list = response.sepet_yemekler {
                        self.sepetYemekListesi = list
                        completion()
                    } else {
                        self.sepetYemekListesi = []
                        completion()
                    }
                } catch {
                    print(error.localizedDescription)
                    self.sepetYemekListesi = []
                    completion()
                }
            } else {
                self.sepetYemekListesi = []
                completion()
            }
        }
    }

    func removeFromCart(cart: FoodsCart, completionHandler: @escaping () -> Void) {
        if let cartID = Int(cart.sepet_yemek_id ?? "0") {
            FoodListManager.shared.removeFromCart(sepetYemekID: cartID, kullaniciAdi: "mali") { result in
                self.showCart(kullaniciAdi: "mali") {
                    completionHandler()
                }
            }
        } else {
            completionHandler()
        }
    }
}
