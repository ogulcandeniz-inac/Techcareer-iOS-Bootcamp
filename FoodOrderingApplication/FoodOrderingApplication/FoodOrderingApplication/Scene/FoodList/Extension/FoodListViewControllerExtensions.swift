//
//  FoodListViewControllerExtensions.swift
//  FoodOrderingApplication
//
//  Created by Oğulcan Deniz İnaç on 30.05.2024.
//

import Foundation
import UIKit
import Kingfisher

extension FoodListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.allFoods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" , for: indexPath) as! FoodListCollectionViewCell
        
        let tempFood = viewModel.allFoods[indexPath.row]
        let url = "http://kasimadalan.pe.hu/yemekler/resimler/"
        
        if let foodImage = tempFood.yemek_resim_adi {
            if let url = URL(string: "\(url)\(foodImage ?? "house.fill")") {
                cell.imageView.kf.setImage(with: url)
            }
        }

        cell.label.text = tempFood.yemek_adi
        cell.priceLabel.text = "₺\(tempFood.yemek_fiyat)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let food = viewModel.allFoods[indexPath.row]
        performSegue(withIdentifier: "toDetailVC", sender: food)
        collectionView.deselectItem(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let food = sender as? Foods {
                let gidilecekVC = segue.destination as! FoodDetailViewController
                gidilecekVC.food = food
            }
        }
    }
}

extension FoodListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.bounds.width - (spacing * (numberOfColumn + 1))
        let cellWidth = availableWidth / numberOfColumn
        return CGSize(width: cellWidth, height: cellWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
}
