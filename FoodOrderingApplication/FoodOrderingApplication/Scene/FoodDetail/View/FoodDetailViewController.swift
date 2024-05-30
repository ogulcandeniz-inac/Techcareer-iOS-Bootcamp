//
//  FoodDetailViewController.swift
//  FoodOrderingApplication
//
//  Created by Oğulcan Deniz İnaç on 30.05.2024.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    var cartFoods: [FoodsCartResponse] = []
    var food: Foods?

    var viewModel = FoodDetailViewModel()
    
    var count :Int = 0
    var resimAdi: String = ""
    @IBOutlet private weak var totalLabel: UILabel!
    @IBOutlet private weak var urunNameLabel: UILabel!
    @IBOutlet private weak var urunImageView: UIImageView!
    
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModel.didLoad()
    }
    
    func setupUI() {
        let url = "http://kasimadalan.pe.hu/yemekler/resimler/"
        if let f = food {
            if let url = URL(string: "\(url)\(f.yemek_resim_adi!)") {
                DispatchQueue.main.async {
                    self.urunImageView.kf.setImage(with: url)
                }
                resimAdi = f.yemek_resim_adi!
            }
            priceLabel.text = "\(f.yemek_fiyat)₺"
            urunNameLabel.text = f.yemek_adi
            totalLabel.text = ""
            
            
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }

    @IBAction func increaseBtn(_ sender: Any) {
        count = count + 1
        countLabel.text = String("Toplam Adet :\(count)")
    }

    @IBAction func decreaseBtn(_ sender: Any) {
        if count > 0 {
            count = count - 1
            countLabel.text = String("Toplam Adet :\(count)")
        }
    }
    
    @IBAction func addCardBtn(_ sender: Any) {
        
        FoodListManager.shared.addToCart(yemek_adi: urunNameLabel.text!, yemek_resim_adi:resimAdi, yemek_fiyat: Int(priceLabel.text!) ?? 0, yemek_siparis_adet: count, kullanici_adi: "mali") { result in
        }
        viewModel.addCart()

    }

}
