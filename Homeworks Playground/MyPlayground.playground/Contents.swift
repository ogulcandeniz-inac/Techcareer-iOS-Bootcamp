import UIKit

var ogrenciAdi = "Deniz"
var ogrenciYas = "23"
var ogrenciBoy = 1.80
var ogrenciBasHarf = "D"
var ogrenciDevamEdiyorMu = true

//print(ogrenciAdi,ogrenciBoy,ogrenciYas,ogrenciBasHarf,ogrenciDevamEdiyorMu)


var urun_id:Int = 3416
var urun_adi:String = "Kol Saati"
var urun_adet:Int = 100
var urun_fiyat:Double = 149.99
var urun_tedarikci:String = "Rolex"


print("Ürün İd        : \(urun_id)")
print("Ürün Adı       : \(urun_adi)")
print("Ürün Adet      : \(urun_adet)")
print("Ürün Fiyat     : \(urun_fiyat)")
print("Ürün Tedarikçi : \(urun_tedarikci)")



let numara = 100
print(numara)

//Tür Dönüşümü - Type Casting
//1. Tür Sayısaldan Sayısala

var i = 42
var d = 56.79

var sonuc1 = Double(i)
var sonuc2 = Int(d)
print(sonuc1)
print(sonuc2)

//2. Sayısaldan Metine

var sonuc3 = String(i)
var sonuc4 = String(d)
print(sonuc3)
print(sonuc4)

//3. Metinden Sayısala

var yazi = "34t"

if var sonuc5 = Int(yazi) {
   print(sonuc5)
}
else {
    print("Dönüşüm Hatası")}
 
 
