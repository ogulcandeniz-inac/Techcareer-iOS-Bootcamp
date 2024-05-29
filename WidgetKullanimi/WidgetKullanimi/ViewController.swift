//
//  ViewController.swift
//  WidgetKullanimi
//
//  Created by Oğulcan Deniz İnaç on 2.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelSwitch.text = "Switch :"
        
        
        let secilenIndeks = segmentControl.selectedSegmentIndex
        
        let kategori = segmentControl.titleForSegment(at: secilenIndeks)
        
        labelSegment.text = "Kategori : \(kategori!)"
        
        
        
        
        Indicator.isHidden = false
        Indicator.startAnimating()
    }
    
    @IBOutlet weak var Indicator: UIActivityIndicatorView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var labelStepper: UILabel!
    @IBOutlet weak var labelSlider: UILabel!
    @IBOutlet weak var mSwitch: UISwitch!
    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var labelSwitch: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func buttonOku(_ sender: Any) {
        
        if let alinanVeri = textField.text {
            labelSonuc.text = alinanVeri
        }
        
    }
    @IBOutlet weak var labelSegment: UILabel!
    
    @IBAction func buttonResim11(_ sender: Any) {
        imageView.image = UIImage(named: "resim2")
    }
    
    @IBAction func buttonResim22(_ sender: Any) {
        imageView.image = UIImage(named: "resim1")
    }
    
    
    @IBAction func switchDegisim(_ sender: UISwitch) {
        
        
        if mSwitch.isOn{
            labelSwitch.text = "Switch : ON"
        }
        else{
            labelSwitch.text = "Switch : OF"
        }
        
        
    }
    
    
    @IBAction func buttonGoster(_ sender: Any) {

            print("Switch Durum : \(mSwitch.isOn)")
            print("TextField Değeri: \(textField.text ?? "")")
            print("Slider Değeri: \(labelSlider.text ?? "")")
            print("Stepper Değeri: \(labelStepper.text ?? "")")
            print("Segment Değeri: \(labelSegment.text ?? "")")
    }
    
    
    @IBAction func segmentDegisim(_ sender: UISegmentedControl) {
        
        let secilenIndeks = sender.selectedSegmentIndex
        
        let kategori = sender.titleForSegment(at: secilenIndeks)
        
        labelSegment.text = "Kategori : \(kategori!)"
        
    }
    
    @IBAction func buttonBasla(_ sender: Any) {
        Indicator.isHidden = false
        Indicator.startAnimating()

    }
    
    @IBAction func buttonDur(_ sender: Any) {
        Indicator.isHidden = true
        Indicator.stopAnimating()
    }
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBAction func sliderDegisim(_ sender: UISlider) {
        
        
        labelSlider.text = String(Int(sender.value))
        
        
    }
    
    @IBAction func stepperDegisim(_ sender: UIStepper) {
    
        labelStepper.text = String(Int(sender.value))
        
        
    }
}

