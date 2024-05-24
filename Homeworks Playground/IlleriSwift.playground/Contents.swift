import UIKit

func metod(ad:String){
    if ad == "Ahmet"{
        print("merhaba ahmet")
    }else{print("Tanınmayan Kişi")}
}

metod(ad: "Ahmetx")


func metodGuard(ad:String){
    guard ad == "Ahmet" else{
        print("Tanınmayan Kişi")
        return
    }
    print("merhaba ahmet")
}
metodGuard(ad: "ahmetb")


//Hata yakalama
//1.Compile Error

let x = 10
//x = 20

//2.Runtime Error (Exception)


enum Hatalar:Error{
    case sifirBolunmeHatasi
}

func bolme(sayi1:Int, sayi2:Int) throws -> Int{
    if sayi2 == 0{
        throw Hatalar.sifirBolunmeHatasi
    }
    
    return sayi1 / sayi2
}

do {
    let sonuc = try bolme(sayi1: 10 , sayi2: 0)
}
catch{
    print("sayi sıfıra bölünmez")}


let sonuc1 = try? bolme(sayi1: 10 , sayi2: 0)
if let temp = sonuc1 {
    print(temp)
}
else{
    print("sayı sıfıra bölünmez")
}


