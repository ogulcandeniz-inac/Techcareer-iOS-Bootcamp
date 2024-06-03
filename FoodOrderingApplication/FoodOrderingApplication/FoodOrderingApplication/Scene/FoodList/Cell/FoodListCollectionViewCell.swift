//
//  FoodListCollectionViewCell.swift
//  FoodOrderingApplication
//
//  Created by Oğulcan Deniz İnaç on 30.05.2024.
//

import UIKit

class FoodListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBAction func favBtn(_ sender: Any) {
    }
    
    @IBAction func addCardBtn(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = CGColor(gray: 0.5, alpha: 0.5)
    }
    
}
