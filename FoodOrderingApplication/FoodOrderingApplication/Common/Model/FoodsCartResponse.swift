//
//  FoodsCartResponse.swift
//  FoodOrderingApplication
//
//  Created by Oğulcan Deniz İnaç on 30.05.2024.
//
import Foundation

class FoodsCartResponse : Codable {
    var sepet_yemekler : [FoodsCart]?
    var success : Int?
}
