import Dispatch
import Foundation

//class C {
//    let name: String
//    var block: (() -> Void)?
//
//    init(name: String) {
//        self.name = name
//        block = {
//            self.doSomething()
//        }
//    }
//    deinit { print("Destroying \(name)") }
//    func doSomething() { print("Doing something for \(name)") }
//}
//
//var c = C(name: "one")
//print(c.name)
//c = C(name: "two")
//print(c.name)


/// Using the Capture List
class SomeObject {
    let name: String
    var block: (() -> Void)?
    
    init(name: String) {
        self.name = name
        block = { [weak self] in  // <-- Here is the change
            self?.doSomething()
        }
    }
    deinit { print("Destroying \(name)") }
    func doSomething() { print("Doing something for \(name)") }
}

var someObject = SomeObject(name: "Object one")
print(someObject.name)
someObject = SomeObject(name: "Object two")
print(someObject.name)

class AnotherObject {
    let name: String
    var block: (() -> Void)?
    
    init(name: String) {
        self.name = name
        block = { [weak self] in
            guard let strongSelf = self else {return} // <-- Here is the change
            strongSelf.doSomething() // Without optional self
        }
    }
    deinit { print("Destroying \(name)") }
    func doSomething() { print("Doing something for \(name)") }
}

var anotherObject = AnotherObject(name: "Object three")
print(anotherObject.name)
anotherObject = AnotherObject(name: "Object four")
print(anotherObject.name)

class ExtendedLifetimeObject {
    let name: String
    var block: (() -> Void)?
    
    init(name: String) {
        self.name = name
        block = { [weak self] in
            withExtendedLifetime(self) { // <-- Here is the change
                self!.doSomething() // Implicitly unwrapped self
            }
        }
    }
    deinit { print("Destroying \(name)") }
    func doSomething() { print("Doing something for \(name)") }
}

var extendedLifetimeObject = ExtendedLifetimeObject(name: "Object five")
print(extendedLifetimeObject.name)
extendedLifetimeObject = ExtendedLifetimeObject(name: "Object six")
print(extendedLifetimeObject.name)
