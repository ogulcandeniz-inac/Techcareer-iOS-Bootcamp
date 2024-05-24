import UIKit

//Karşılaştırma Operatörleri

var a = 40
var b = 50

var x = 90
var y = 80

print("a == b : \(a == b)")
print("a != b : \(a != b)")
print("a <= b : \(a <= b)")
print("a >= b : \(a >= b)")




print("a > b || x > y : \(a > b || x > y)")


print("a > b && x > y : \(a > b && x > y)")


//if

var yas = 19
var isim = "Oğulcan"


if yas >= 18 {
    print("Reşitsiniz")
}
else{
    print("Reşit Değilsiniz")
}

if isim == "Deniz"{
    print("Doğru İsim")
}
else if isim == "Oğulcan" {
    print("Merhaba Oğulcan")
}
else {
    print("Yanlış İsim")
}


var od = "admin"
var s = 123456


if od == "admin" && s == 123456 {
    print("Hoşgeldiniz")
}
else {
    print("Hatalı Giriş")
}



var sonuc = 9

if sonuc == 9 || sonuc == 10 {
    print("sonuc 9 veya 10 dur")
}
else { print("sonuc 9 veya 10 değildir")
}


a ==  b ? print("Eşit") : print("Eşit Değil")



var sayi = 3

switch sayi {
    case 1: print("Sayı : 1")
    case 2: print("Sayı : 2")
    case 3: print("Sayı : 3")
    default: print("Böyle bir sayı yok")
}


//Döngüler
//1,2,3
for i in 1...3 {// Kotlin dilinde ise 1..3 şeklinde kullanım sağlanılır.
    print("Döngü 1 : \(i)")
}


//10 ile 20 arasında fakat 5 er artış sağlanacak


for x in stride(from: 10, through: 20, by: 5) {
    print("Döngü 2 : \(x)")
}


var sayac = 1

while sayac < 4 {
    print("Döngü 3 : \(sayac)")
    sayac+=1
}

for i in 1...5 {
    if i == 3 {
        break
   
    }
    print("Döngü 4 : \(i)")
}


for i in 1...5 {
    if i == 3 {
        continue
   
    }
    print("Döngü 5 : \(i)")
}
