//
//  KisiKayit.swift
//  KisilerUygulamasi
//
//  Created by Oğulcan Deniz İnaç on 12.05.2024.
//

import UIKit

class KisiKayit: UIViewController {
    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var viewModel = KisiKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonKaydet(_ sender: Any) {
        if let ad = tfKisiAd.text, let tel = tfKisiTel.text {
            viewModel.kaydet(kisi_ad: ad, kisi_tel: tel)
        }
    }
}
