//
//  ViewController.swift
//  LokasyonKullanimi
//
//  Created by Oğulcan Deniz İnaç on 21.05.2024.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var labelHiz: UILabel!
    @IBOutlet weak var labelBoylam: UILabel!
    @IBOutlet weak var labelEnlem: UILabel!
    @IBOutlet weak var mapKit: MKMapView!
    
    @IBOutlet weak var myView: UIView!
    var locationManager = CLLocationManager()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            myView.layer.cornerRadius = 10 // İstediğiniz değeri buraya girin
               myView.layer.masksToBounds = true
               myView.layer.borderColor = UIColor.black.cgColor
               myView.layer.borderWidth = 1.0
               myView.layer.shadowColor = UIColor.gray.cgColor
               myView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
               myView.layer.shadowRadius = 4.0
               myView.layer.shadowOpacity = 0.5
               myView.layer.masksToBounds = false
            
            
            
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.delegate = self
            
            let konum = CLLocationCoordinate2D(latitude: 41.0370175, longitude: 28.974792)
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let region = MKCoordinateRegion(center: konum, span: span)
            
            mapKit.setRegion(region, animated: true)
            
            let pin = MKPointAnnotation()
            pin.coordinate = konum
            pin.title = "Konum"
            pin.subtitle = "Alt başlık"
            mapKit.addAnnotation(pin) // Eksik kısmı tamamlıyoruz
        }
    }

    extension ViewController: CLLocationManagerDelegate {
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let sonKonum = locations.last {
                labelEnlem.text = "Enlem: \(sonKonum.coordinate.latitude)"
                labelBoylam.text = "Boylam: \(sonKonum.coordinate.longitude)"
                labelHiz.text = "Hız: \(sonKonum.speed)"
            }
        }
    }
