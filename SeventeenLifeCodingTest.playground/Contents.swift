import Foundation

protocol Producing {
    var firstCount: Int { get set }
    var secondCount: Int { get set }
}

struct SomeProduct:Producing {
    var firstCount: Int = 1
    var secondCount: Int = 2
}

extension Producing {
    var totalCount: Int {
        get { return firstCount + secondCount }
    }
    
    func description(_ message: String) -> String {
        return "\(message)\(totalCount)"
    }
}

let product:Producing = SomeProduct()

product.totalCount
product.description("17Life")


class ClassA {
    var a:Int = 1
}
struct StructB {
    var b:Int = 1
}
var a1 : ClassA? = ClassA()
let a2 : ClassA = ClassA()
var b1 : StructB = StructB()
let b2 : StructB = StructB()

//a1?.a = 2
//
//b1.b = 2
//
//a2.a = 2
//
//b2.b = 2
//
//b1 = b2
//
//a2 = a1

@objc enum PaymentType: Int {
    case Credit, Cash, ApplePay, GooglePay, AFTEE
}

