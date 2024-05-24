import UIKit

//Optinal - Nullable - Nul Safety
//nil - nun - NaN

//Tanımlama
var mesaj: String? = nil
var message: String?

message = "Hello"
//Kullanım

if message != nil {
    print(message!) //optional unwrapping
}
else {
    print("message içeriği nildir")
}

if var temp = message {//optional binding
    print(temp)//otomatik unwrapping
    temp = "how are you"
    print(temp)
}
else{
    print("message içeriği nil'dir")
}
