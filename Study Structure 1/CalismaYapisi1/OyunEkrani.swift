//
//  OyunEkrani.swift
//  CalismaYapisi
//
//  Created by Kasım on 28.04.2024.
//

import UIKit

class OyunEkrani: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonGeri(_ sender: Any) {
    navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func buttonBitir(_ sender: Any) {
        performSegue(withIdentifier: "sonucEkranınaGecis", sender: nil)
    }
}
