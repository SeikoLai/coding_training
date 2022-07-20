import Foundation

// Refactor class
class ShoppingCart {
    
    func isStock(proudctId: Int) -> Bool {
        return true
    }
    
    func isPromotion(productId: Int) -> Bool {
        return true
    }
}

let id = 123
let shoppingCart = ShoppingCart()
shoppingCart.isStock(proudctId: id)
shoppingCart.isPromotion(productId: id)

// 優惠協定
protocol DiscountProtocol {
    // 計算優惠價格
    func calculateDiscount(price: Double, ratio: Double) -> Double
}

// 優惠物件實作優惠協定
class Discount: DiscountProtocol {
    // 實作優惠協定方法
    func calculateDiscount(price: Double, ratio: Double) -> Double {
        return price * ratio
    }
}

// Refactor class
class Calculator {
    
    // 原始方法
    func calProductDiscount(productPrice: Double, productNum: Double) -> Double {
        var total = productPrice * productNum
        
        if (total > 20000) {
            total = total * 0.85
        }
        else if (total > 10000) {
            total = total * 0.9
        }
        else if (total > 5900) {
            total = total * 0.95
        }
        return total
    }
    
    // 將優惠邏輯拆分出來，後續可個別維護、調整或測試
    // 第一種優惠計算邏輯
    func level1Discount(totalPrice: Double) -> Double {
        return totalPrice * 0.85
    }
    
    // 第二種優惠計算邏輯
    func level2Discount(totalPrice: Double) -> Double {
        return totalPrice * 0.9
    }
    
    // 第三種優惠計算邏輯
    func level3Discount(totalPrice: Double) -> Double {
        return totalPrice * 0.95
    }
    
    // 使用方法計算邏輯
    func improveCalProductDiscount(productPrice: Double, productNum: Double) -> Double {
        
        let total = productPrice * productNum
        
        // 使用 switch 取代 if，更清楚區分優惠價格區間
        // 然後指定優惠邏輯計算價格
        switch total {
        case 20001 ... Double.infinity:
            return level1Discount(totalPrice: total)
        case 10001 ... 20000:
            return level2Discount(totalPrice: total)
        case 5901 ... 10000:
            return level3Discount(totalPrice: total)
        default:
            return total
        }
    }
    
    // 使用物件處理邏輯
    func anotherImproveCalProductDiscount(productPrice: Double, productNum: Double) -> Double {
        
        let total = productPrice * productNum
        
        // 使用 switch 取代 if，更清楚區分優惠價格區間
        // 然後指定優惠計算物件
        switch total {
        case 20001 ... Double.infinity:
            return Discount().calculateDiscount(price: total, ratio: 0.85)
        case 10001 ... 20000:
            return Discount().calculateDiscount(price: total, ratio: 0.9)
        case 5901 ... 10000:
            return Discount().calculateDiscount(price: total, ratio: 0.95)
        default:
            return total
        }
        
    }
}

let price: Double = 5900
let number: Double = 1
let calculator = Calculator()

let discount = calculator.calProductDiscount(productPrice: price, productNum: number)

let discount2 = calculator.improveCalProductDiscount(productPrice: price, productNum: number)

let discount3 = calculator.anotherImproveCalProductDiscount(productPrice: price, productNum: number)

// Retain cycle 的觀念
// var vs let 的用法
//class Order {
//
//    func create() {
//        print("Create order")
//    }
//}
//
//class User {
//
//    // 用 var 宣告 order 為 optional
//    var order: Order? = Order()
//
//    func addOrder() {
//        // order 改為 optional
//        self.order?.create()
//    }
//}

// 用 var 宣告 user 為 optional
//var user: User? = User()
//user?.addOrder()


// Race condition
// DispatchQueue
struct Product {
    static var stock = 2000
}

class User {
    
    func buy(value: Int) {
        if Product.stock > value {
            Thread.sleep(forTimeInterval: Double.random(in: 0...1))
            Product.stock -= value
            print("商品庫存數： \(Product.stock)")
        }
        else {
            print("庫存不足")
        }
    }
}

// Origin function
func run() {
    
    let user1 = User()
    let user2 = User()
    
    let queue = DispatchQueue(label: "userQueue", attributes: .concurrent)
    
    queue.async {
        user1.buy(value: 1000)
    }
    
    queue.async {
        user2.buy(value: 1500)
    }
    
}

func runWithDispatchQueueBarrierFlag() {
    let user1 = User()
    let user2 = User()
    
    let queue = DispatchQueue(label: "userQueue", attributes: .concurrent)
    
    // Use a barrier to synchronize the execution of one or more tasks in your dispatch queue.
    queue.async(flags: .barrier) {
        user1.buy(value: 1000)
    }
    
    queue.async(flags: .barrier) {
        user2.buy(value: 1500)
    }
}

func runWithoutDispatchQueueConcurrent() {
    let user1 = User()
    let user2 = User()
    
    let queue = DispatchQueue(label: "userQueue")
    
    queue.async {
        user1.buy(value: 1000)
    }
    
    queue.async {
        user2.buy(value: 1500)
    }
}


//run()
runWithDispatchQueueBarrierFlag()
//runWithoutDispatchQueueConcurrent()


