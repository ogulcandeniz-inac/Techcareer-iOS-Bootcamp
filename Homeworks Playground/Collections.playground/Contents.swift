import UIKit

//Array
//Java ve Kotlin (ArrayList), Dart (List)

var sayilar = [5,17,8]
var meyveler = [String]() //String burada kullanılacak türü belirler


//Veri ekleme
meyveler.append("Elma")//0. endekse eklenecek
meyveler.append("Muz")
meyveler.append("Kiraz")
print(meyveler)

//Güncelleme
meyveler[0] = "Yeni Elma"
print(meyveler)


//Insert
meyveler.insert("Portakal", at: 1)
print(meyveler)


//Okuma
print(meyveler[3])

print("Boyut : \(meyveler.count)")
print("Boş kontrol : \(meyveler.isEmpty)")
print("İçeriyor mu? : \(meyveler.contains("Muz"))")


for (indeks,meyve) in meyveler.enumerated(){
    print("\(indeks). ->\(meyve)")
}

meyveler.remove(at: 2)
print(meyveler)


meyveler.removeAll()
print(meyveler)

//Array Nesne Tabnlı
class Yemekler {
    var id:Int?
    var ad:String?
    var fiyat:Int?
    
    init(id: Int, ad: String, fiyat: Int){
        self.id = id
        self.ad = ad
        self.fiyat = fiyat
    }
}

var y1 = Yemekler(id: 1, ad: "Lazanya", fiyat: 200)
var y2 = Yemekler(id: 2, ad: "Kadayıf", fiyat: 100)
var y3 = Yemekler(id: 3, ad: "Baklava", fiyat: 500)


var yemeklerListesi = [Yemekler]()
yemeklerListesi.append(y1)
yemeklerListesi.append(y2)
yemeklerListesi.append(y3)


for y in yemeklerListesi{
    print("\(y.id!) - \(y.ad!) - \(y.fiyat!) TL")
}


//Filitreleme
var f1 = yemeklerListesi.filter({$0.fiyat! > 150 })


for y in f1{
    print("\(y.id!) - \(y.ad!) - \(y.fiyat!) TL")
}

var f2 = yemeklerListesi.filter({$0.ad!.contains("ay")})

for y in f2{
    print("\(y.id!) - \(y.ad!) - \(y.fiyat!) TL")
}

// Sorting - Sıralama
var s1 = yemeklerListesi.sorted(by: { $0.fiyat! > $1.fiyat! })
print("Fiyat : Azalan")
for y in s1 {
    print("\(y.id!) - \(y.ad!) - \(y.fiyat!) TL")
}
var s2 = yemeklerListesi.sorted(by: { $0.ad! > $1.ad! })
print("Fiyat : Artan")
for y in s2 {
    print("\(y.id!) - \(y.ad!) - \(y.fiyat!) TL")
}
var s3 = yemeklerListesi.sorted(by: { $0.ad! > $1.ad! })
print("Fiyat : Azalan")
for y in s3 {
    print("\(y.id!) - \(y.ad!) - \(y.fiyat!) TL")
}

var s4 = yemeklerListesi.sorted(by: { $0.ad! > $1.ad! })
print("Fiyat : Artan")
for y in s4 {
    print("\(y.id!) - \(y.ad!) - \(y.fiyat!) TL")
}


//Set çalışması
//HasSet

var meyveler1 = Set<String>()

//Veri ekleme
meyveler1.insert("Elma")
meyveler1.insert("Muz")
meyveler1.insert("Kiraz")
print(meyveler1)

meyveler1.insert("Amasya Elma")
print(meyveler1)

meyveler1.remove("Amasya Elma")
print(meyveler1)


//Dictinory
//Map - HashMap
var iller = [Int:String]()
//Veri ekleme
iller[16] = "Bursa"
iller[06] = "Ankara"
print(iller)


//Veri okuma
print(iller[16]!)

//Veri Güncelleme
iller[16] = "Yeni Bursa"
print(iller)

for(anahtar,deger) in iller{
    print("\(anahtar) : \(deger)")
}


iller.removeValue(forKey: 16)


iller.removeAll()
print(iller)
