//
//  FoodListManager.swift
//  FoodOrderingApplication
//
//  Created by Oğulcan Deniz İnaç on 30.05.2024.
//

import Foundation
import Alamofire

enum NetworkErrorTypes: Error {
    case urlError
    case decodeError
    case any(error: Error)

}

class FoodListManager {

    static let shared = FoodListManager()

    func getFoods(completionHandler: @escaping (Result<FoodsResponse, NetworkErrorTypes>) -> Void) {
        let urlString = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php"

        guard let url = URL(string: urlString) else {
            completionHandler(.failure(NetworkErrorTypes.urlError))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in

            if let error = error {
                completionHandler(.failure(.any(error: error)))
            }

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(FoodsResponse.self, from: data)
                    completionHandler(.success(decodedData))
                } catch {
                    completionHandler(.failure(NetworkErrorTypes.decodeError))
                }
            }
        }.resume()
    }

    func addToCart(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String, completionHandler: @escaping (Result<String, NetworkErrorTypes>) -> Void) {

        let urlString = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php"

        let parameters: [String: Any] = [
            "yemek_adi": yemek_adi,
            "yemek_resim_adi": yemek_resim_adi,
            "yemek_fiyat": yemek_fiyat,
            "yemek_siparis_adet": yemek_siparis_adet,
            "kullanici_adi": kullanici_adi
        ]

        AF.request(urlString,
            method: .post,
            parameters: parameters)
            .responseString { response in
            switch response.result {
            case .success(let responseString):
                completionHandler(.success(responseString))
            case .failure(let error):
                completionHandler(.failure(.any(error: error)))
            }
        }
    }

    func showCart(kullaniciAdi: String, completionHandler: @escaping (Result<FoodsCartResponse, NetworkErrorTypes>) -> Void) {
        let baseUrlString = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php"
        let parameters: [String: Any] = ["kullanici_adi": kullaniciAdi]

        AF.request(baseUrlString, method: .post,
            parameters: parameters)
            .responseJSON { response in
            switch response.result {
            case .success:
                print("deneme 2")
                if let data = response.data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(FoodsCartResponse.self, from: data)
                        completionHandler(.success(decodedData))
                        print(decodedData.sepet_yemekler)
                    } catch {
                        completionHandler(.failure(NetworkErrorTypes.decodeError))
                    }
                } else {
                    completionHandler(.failure(NetworkErrorTypes.urlError))
                }
            case .failure(let error):
                print("deneme 3")
                completionHandler(.failure(.any(error: error)))
            }
        }
    }

    func removeFromCart(sepetYemekID: Int, kullaniciAdi: String, completionHandler: @escaping (Result<String, NetworkErrorTypes>) -> Void) {
        let baseUrlString = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php"

        let parameters: [String: Any] = [
            "sepet_yemek_id": sepetYemekID,
            "kullanici_adi": kullaniciAdi
        ]

        AF.request(baseUrlString, method: .post,
            parameters: parameters)
            .responseString { response in
            switch response.result {
            case .success(let responseString):
                completionHandler(.success(responseString))
            case .failure(let error):
                completionHandler(.failure(.any(error: error)))
            }
        }
    }
}
