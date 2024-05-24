import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sonucEtiketi: UILabel!
    var ekrandakiSayi: Double = 0
        var oncekiSayi: Double = 0
        var matematikselIslemYapiliyor = false
        var islem: Int?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            resetle()
        }

    @IBAction func sayilar(_ sender: UIButton) {
        if matematikselIslemYapiliyor {
                    sonucEtiketi.text = String(sender.tag)
                    matematikselIslemYapiliyor = false
                } else {
                    if sonucEtiketi.text == "0" {
                        sonucEtiketi.text = ""
                    }
                    sonucEtiketi.text! += String(sender.tag)
                }
                ekrandakiSayi = Double(sonucEtiketi.text!) ?? 0
    }

    @IBAction func islemler(_ sender: UIButton) {
        if sender.tag != 11 && sender.tag != 16 {
                    if let oncekiDeger = Double(sonucEtiketi.text ?? "") {
                        oncekiSayi = oncekiDeger
                    }
                    switch sender.tag {
                    case 12: // Bölme
                        sonucEtiketi.text = "÷"
                    case 13: // Çarpma
                        sonucEtiketi.text = "×"
                    case 14: // Çıkarma
                        sonucEtiketi.text = "-"
                    case 15: // Toplama
                        sonucEtiketi.text = "+"
                    default:
                        break
                    }
                    islem = sender.tag
                    matematikselIslemYapiliyor = true
                } else if sender.tag == 16 { // Eşittir
                    if let operation = islem {
                        switch operation {
                        case 12:
                            sonucEtiketi.text = String(oncekiSayi / ekrandakiSayi)
                        case 13:
                            sonucEtiketi.text = String(oncekiSayi * ekrandakiSayi)
                        case 14:
                            sonucEtiketi.text = String(oncekiSayi - ekrandakiSayi)
                        case 15:
                            sonucEtiketi.text = String(oncekiSayi + ekrandakiSayi)
                        default:
                            break
                        }
                    }
                    islem = nil
                    matematikselIslemYapiliyor = false // matematiksel işlem yapılmadığına ayarla
                } else if sender.tag == 11 { // AC (Hepsini temizle)
                    resetle()
                }
            }
    
    @IBAction func yuzde(_ sender: UIButton) {
        ekrandakiSayi = (Double(sonucEtiketi.text!) ?? 0) / 100
        sonucEtiketi.text = String(ekrandakiSayi)
    }
    
    @IBAction func nokta(_ sender: UIButton) {
        if sonucEtiketi.text?.contains(".") == false {
            sonucEtiketi.text = sonucEtiketi.text! + "."
        }
    }
    
    @IBAction func sifirla(_ sender: Any) {
    resetle()
    }
    
    
    func resetle() {
            sonucEtiketi.text = "0"
            oncekiSayi = 0
            ekrandakiSayi = 0
            islem = nil
            matematikselIslemYapiliyor = false
        }
}
