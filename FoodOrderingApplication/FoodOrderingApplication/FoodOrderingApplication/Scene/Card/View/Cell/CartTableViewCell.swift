//
//  CartTableViewCell.swift
//  FoodOrderingApplication
//
//  Created by Oğulcan Deniz İnaç on 30.05.2024.
//
import UIKit

class CartTableViewCell: UITableViewCell {

    var onTapAction: (() -> Void)?
    var food: Foods?
    
    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var cartFoodName: UILabel!
    @IBOutlet weak var cartPrice: UILabel!
    
    @IBOutlet weak var cartPrice2: UILabel!
    @IBOutlet weak var cartTotalPrice: UILabel!
    @IBOutlet weak var cartTotal: UILabel!
   
    
    func configure(with food: FoodsCart) {
        
        
            cartFoodName.text = food.yemek_adi
            cartPrice.text = food.yemek_fiyat
            cartPrice2.text = food.yemek_siparis_adet
            cartTotal.text = "Ürün Adet: \(food.yemek_siparis_adet ?? "0")"
            
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi ?? "")") {
                DispatchQueue.main.async {
                    self.cartImageView.kf.setImage(with: url)
                }
            }
        }

        
        override func awakeFromNib() {
            super.awakeFromNib()
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }


    
    @IBAction func deleteButton(_ sender: Any) {
        onTapAction?()
    }
    
}
