//
//  KisiDetay.swift
//  KisilerUygulamasi
//
//  Created by Oğulcan Deniz İnaç on 12.05.2024.
//

import UIKit

class KisiDetay: UIViewController {
    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var kisi:Kisiler?
    
    var viewModel = KisiDetayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let k = kisi {
            tfKisiAd.text = k.kisi_ad
            tfKisiTel.text = k.kisi_tel
        }
    }

    @IBAction func buttonGuncelle(_ sender: Any) {
        if let k = kisi,let ad = tfKisiAd.text,let tel = tfKisiTel.text {
            viewModel.guncelle(kisi_id: Int(k.kisi_id!)!, kisi_ad: ad, kisi_tel: tel)
        }
    }
}


