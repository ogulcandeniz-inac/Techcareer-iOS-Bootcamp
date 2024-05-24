import UIKit

//Kenar sayısına göre her bir iç açı hesabı
func icAciHesapla(kenarSayisi: Int) -> Double? {
    guard kenarSayisi > 2 else {
        print("Kenar sayısı 2'den büyük olmalıdır.")
        return nil
    }
    
    let icAci = Double((kenarSayisi - 2) * 180) / Double(kenarSayisi)
    return icAci
}

if let hesaplananIcAci = icAciHesapla(kenarSayisi: 10) {
    print("İç Açılar        : \(hesaplananIcAci)")
} else {
    print("Hesaplama başarısız.")
}

//Girilen gün sayısına göre maaş hesabı
func hesaplaMaas(gunSayisi: Int, mesaiSaati: Int) -> Double {
    let normalSaatUcreti: Double = 40
    let mesaiSaatUcreti: Double = 80
    let mesaiSiniri: Int = 150
    let maksimumNormalCalismaSaati = 8
    
    let gunlukCalismaSaati = min(maksimumNormalCalismaSaati, mesaiSaati)
    
    let normalMaas = Double(gunSayisi * gunlukCalismaSaati) * normalSaatUcreti
    let mesaiSaatleri = max(mesaiSaati - maksimumNormalCalismaSaati, 0)
    let normalMesai = min(mesaiSaatleri, mesaiSiniri)
    let fazlaMesai = max(mesaiSaatleri - mesaiSiniri, 0)
    let mesaiMaasi = (Double(normalMesai) * mesaiSaatUcreti) + (Double(fazlaMesai) * (mesaiSaatUcreti * 2))
    
    return normalMaas + mesaiMaasi
}

let maas = hesaplaMaas(gunSayisi: 20, mesaiSaati: 160)
print("Toplam Maaş      : \(maas) TL")

//Otopark süresine göre otopark ücreti hesaplama
func hesaplaOtoparkUcreti(sure: Int) -> Double {
    let baslangicUcreti = 50.0
    let ekUcret = 10.0
    
    guard sure > 0 else {
        print("Hata: Geçersiz otopark süresi.")
        return 0
    }
    
    if sure == 1 {
        return baslangicUcreti
    }
    
    return baslangicUcreti + Double(sure - 1) * ekUcret
}

let otoparkUcreti = hesaplaOtoparkUcreti(sure: 3)
print("Otopark Ücreti   : \(otoparkUcreti) TL")


//Dikdörtgen alanı hesaplama
func hesaplaDikdortgenAlanı(uzunKenar: Double, kısaKenar: Double) -> Double {
    return uzunKenar * kısaKenar
}

let uzunKenar = 5.0
let kısaKenar = 3.0
let alan = hesaplaDikdortgenAlanı(uzunKenar: uzunKenar, kısaKenar: kısaKenar)
print("Dikdörtgen Alanı : \(alan)")


//Faktoriyel değeri hesaplama
func hesaplaFaktoriyel(sayi: Int) -> Int {
    guard sayi >= 0 else {
        return 1
    }
    
    return (1...sayi).reduce(1, *)
}

let sayi = 5
let faktoriyel = hesaplaFaktoriyel(sayi: sayi)
print("\(sayi)! Sayısının Değeri : \(faktoriyel)")


//Kilometreyi mile dönüştürme
func kmDegisMile(km: Double) -> Double {
    return km * 0.621
}

let km = 10.0
let mile = kmDegisMile(km: km)
print("\(km) kilometre \(mile) mil eder.")


//Kelime içinde kaç adet 'E veya e' harfi olduğuna ait hesaplama
func hesaplaEHarfSayisi(kelime: String) -> Int {
    let eHarfSayisi = kelime.lowercased().filter { $0 == "e" }.count //lowercased : Harfleri küçük hallerine çevirmeyi sağlar.
    return eHarfSayisi
}

let kelime = "Edirne"
let eHarfSayisi = hesaplaEHarfSayisi(kelime: kelime)
print("Kelimenin içindeki 'E veya e' harfi sayısı: \(eHarfSayisi)")
