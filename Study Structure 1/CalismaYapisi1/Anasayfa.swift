//
//  ViewController.swift
//  CalismaYapisi
//
//  Created by Kasım on 28.04.2024.
//

import UIKit

class Anasayfa: UIViewController {
    @IBOutlet weak var labelAnasayfa: UILabel!
    
    var sayac = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTikla(_ sender: Any) {
        sayac = sayac + 1
        labelAnasayfa.text = String(sayac)
    }
    
    @IBAction func buttonBasla(_ sender: Any) {
        performSegue(withIdentifier: "oyunEkraninaGecis", sender: nil)
    }
}

