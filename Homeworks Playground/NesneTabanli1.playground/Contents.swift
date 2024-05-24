import UIKit

class Product {
    var id: Int?
    var name: String?
    var price: Int?
    
    init(){
        print("Boş constructor çalıştı.")
    }
    
    init(id:Int, name:String, price:Int){
        self.id = id//Shodowing
        self.name = name
        self.price = price
    }
    
    
    func increasePrice(amount:Int){
        //price! = price! + amount
        price!+=amount
    }
    
    func decrasePrice(amount:Int){
        //price! = price! - amount
        price!-=amount
    }
    
    func GetInfo(){
        print("---------------------")
        print("Id    : \(id!)")
        print("İsim  : \(name!)")
        print("Price : \(price!)TL")
    }
}

var product1 = Product(id: 1, name: "TV", price: 9500)

/*
product1.id = 1
product1.name = "TV"
product1.price = 9500
 */

product1.GetInfo()
product1.increasePrice(amount: 1000)
product1.GetInfo()
product1.decrasePrice(amount: 500)
product1.GetInfo()

var product2 = Product()

product2.id = 2
product2.name = "Saat"
product2.price = 3000


product2.GetInfo()
product2.increasePrice(amount: 2000)
product2.GetInfo()
product2.decrasePrice(amount: 1000)
product2.GetInfo()


// Fonksiyonlar

class Fonksiyonlar {
    //void - geri dönüş yoktur
    
    func selamla1(){
        let sonuc = "Merhaba Deniz"
        print(sonuc)
    }
    
    //return - geri dönüş vardır
    
    func selamla2() -> String {
        let sonuc = "Merhaba Deniz"
        return sonuc
    }
    
    func selamla3(isim:String){
        let sonuc = "Merhaba \(isim)"
        print(sonuc)
    }
    
    //overloading - Mülakat
    func carpma(sayi1:Int,sayi2:Int){
        print("Çarpma : \(sayi1 * sayi2)")
    }
    
    func carpma(sayi1:Double,sayi2:Double){
        print("Çarpma : \(sayi1 * sayi2)")
    }
    func carpma(sayi1:Int,sayi2:Int,isim:String){
        print("Çarpma : \(sayi1 * sayi2) - İşlemi yapan :\(isim)")
    }
}


let f = Fonksiyonlar()
f.selamla1()


let gelenSonuc = f.selamla2()
print("Gelen Sonuç : \(gelenSonuc)")

f.selamla3(isim: "E")
f.carpma(sayi1: 10, sayi2: 10)

f.carpma(sayi1: 10, sayi2: 20, isim: "Deniz")


//Static
//Kotlin : Companion Object

class ClassA {
    static var x = 10
    static func metod(){
        print("metod çalıştı")
    }
}

let a = ClassA()

//print(a.x)
//a.metod()

//Sanal Nesne Virtual Object - Namaless
//print(ClassA().x)
//ClassA().metod()

print(ClassA.x)
ClassA.metod()

//Enumaration

enum KonserveBoyut {
    case kucuk
    case orta
    case buyuk
}

func ucretHesapla(boyut:KonserveBoyut,adet:Int){
    switch boyut {
    case .kucuk: print("Ücret : \(adet * 26) TL")
    case .orta: print("Ücret : \(adet * 57) TL")
    case .buyuk: print("Ücret : \(adet * 84) TL")
        
    }
}

ucretHesapla(boyut: .orta, adet: 674)

//Composition

class Kategoriler {
    var katgori_id: Int?
    var katgori_ad: String?
    
    init(kategori_id: Int, katgori_ad: String){
        self.katgori_id = kategori_id
        self.katgori_ad = katgori_ad
    }
}

class Yonetmenler {
    var yonetmen_id: Int?
    var yonetmen_ad: String?
    
    init(yonetmen_id: Int, yonetmen_ad: String){
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
    }
}

class Filmler {
    var film_id: Int?
    var film_ad: String?
    var film_yil: Int?
    var kategori:Kategoriler?
    var yonetmen:Yonetmenler?
    
    init(film_id: Int, film_ad: String,film_yil: Int,kategori:Kategoriler,yonetmen:Yonetmenler){
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_yil = film_yil
        self.kategori = kategori
        self.yonetmen = yonetmen
    }
}


let k1 = Kategoriler(kategori_id: 1, katgori_ad: "Dram")
let k2 = Kategoriler(kategori_id: 2, katgori_ad: "Bilim Kurgu")


let y1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Quentin Tarantino")
let y2 = Yonetmenler(yonetmen_id: 2, yonetmen_ad: "Christopher Nolan")


let f1 = Filmler(film_id: 1, film_ad: "Django", film_yil: 2018, kategori: k1, yonetmen: y1)

print("\nFilm id       : \(f1.film_id!)")
print("Film ad       : \(f1.film_ad!)")
print("Film yıl      : \(f1.film_yil!)")
print("Film kategori : \(f1.kategori!.katgori_ad!)")
print("Film yonetmen : \(f1.yonetmen!.yonetmen_ad!)")


//Kalıtım - Miras - Inheritance

class Ev {
    var pencereSayisi: Int?
}

class Saray {
    
}


class Villa {
    
}


//Ovveride kullanımı
class Hayvan {
    func sesCikar(){
        print("Sesim yok")
    }
}

class Memeli : Hayvan{
    
}

class Kedi : Memeli{
    override func sesCikar(){
        print("Miyav")
    }
}

class Kopek : Memeli{
    override func sesCikar(){
        print("Hav")
    }
}

let hayvan = Hayvan()
let memeli = Hayvan()
let kedi = Kedi()
let kopek = Kopek()


hayvan.sesCikar()
memeli.sesCikar()
kedi.sesCikar()
kopek.sesCikar()


//Downcasting
//Ev > Saray
/*
 class Villa: Ev{
 var garajVarMi: Bool?
 init(garajVarmİ:Bool, pencereSayisi: Int){
 super.init(pencereSayisi: pencereSayisi)
 self.garajVarMi = garajVarmİ
 }
 }
 var saray = Ev(penereSayisi: 5) as? Saray
 
 
 //Upcasting
 //Saray > Ev
 var ev = Saray(kuleSayisi: 2, pencereSayisi: 100) as Ev
 
 //Tip kontrolü
 if saray is Saray? {
 print("Saraydır")
 }
 else{
 print("Saray değildir")
 }
 */


//Protocol
//Interface(Java - Kotlin - Dart vb.)


protocol MyProtocol {
    var degisken : Int{get set}
    
    func method()
    
    func metod2() -> String
}

class MyClass : MyProtocol{
    var degisken: Int = 10
    
    func method(){print("Method 1 Çalıştı")}
    
    func metod2() -> String{return "Method 2 çalıştı"}
}


let myClass = MyClass()

print(myClass.degisken)
myClass.method()
print(myClass.metod2())

//Extension
extension Int{
    func carp(sayi:Int) -> Int {return self * sayi}
}
let sonuc = 5.carp(sayi: 3)
print(sonuc)


//Closure
let ifade = {
    print("merhaba")
}
ifade()
