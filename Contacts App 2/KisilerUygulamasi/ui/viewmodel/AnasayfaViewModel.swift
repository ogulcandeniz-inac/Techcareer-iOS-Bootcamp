//
//  AnasayfaViewModel.swift
//  KisilerUygulamasi
//
//  Created by Oğulcan Deniz İnaç on 12.05.2024.
//

import Foundation
import RxSwift

class AnasayfaViewModel {
    var krepo = KisilerRepository()
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    init(){
        kisilerListesi = krepo.kisilerListesi
    }
    
    func ara(aramaKelimesi:String){
        krepo.ara(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(kisi_id:Int){
        krepo.sil(kisi_id: kisi_id)
        kisileriYukle()
    }
    
    func kisileriYukle(){
        krepo.kisileriYukle()
    }
}
