//
//  FoodCardViewController.swift
//  FoodOrderingApplication
//
//  Created by Oğulcan Deniz İnaç on 30.05.2024.
//

import UIKit

class FoodCardViewController: UIViewController {
    
   var viewModel = FoodCardViewModel()

    @IBOutlet weak var cartTableView: UITableView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
           cartTableView.dataSource = self
           cartTableView.delegate = self
       }
       
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           viewModel.showCart(kullaniciAdi: "mali") { [weak self] in
               DispatchQueue.main.async {
                   self?.cartTableView.reloadData()
               }
           }
       }
   }

   extension FoodCardViewController: UITableViewDelegate, UITableViewDataSource {
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return viewModel.sepetYemekListesi.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
           let yemekDetay = viewModel.sepetYemekListesi[indexPath.row]
           
           if let fiyatString = yemekDetay.yemek_fiyat,
              let fiyat = Double(fiyatString),
              let siparisAdetString = yemekDetay.yemek_siparis_adet,
              let siparisAdet = Int(siparisAdetString) {
               let toplamFiyat = fiyat * Double(siparisAdet)
               cell.cartTotal.text = "\(String(format: "%.2f", toplamFiyat))₺"
           } else {
               cell.cartTotal.text = "Bilinmiyor"
           }
           
           cell.cartFoodName.text = yemekDetay.yemek_adi
           
           if let resimAdi = yemekDetay.yemek_resim_adi,
              let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
               cell.cartImageView.kf.setImage(with: url)
           }
           
           cell.onTapAction = { [weak self] in
               self?.viewModel.removeFromCart(cart: yemekDetay) {
                   DispatchQueue.main.async {
                       self?.viewModel.showCart(kullaniciAdi: "mali") {
                           DispatchQueue.main.async {
                               self?.cartTableView.reloadData()
                           }
                       }
                   }
               }
           }
           
           // Toplam fiyatı UserDefaults'tan okuma
           if let toplamFiyat = UserDefaults.standard.value(forKey: "toplamFiyat") as? Double {
               cell.cartTotal.text = "\(String(format: "%.2f", toplamFiyat))₺"
           }
           
           return cell
       }
   }
