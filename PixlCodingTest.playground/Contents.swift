var test1 = [4, 10, 5, 4, 2, 10] // 5
var test2 = [1, 4, 3, 3, 1, 2] // 4
var test3 = [6, 4, 4, 6] // -1
var test4 = [-10]


// A non-empty array A consisting of N integers is given. The unique number is the number that occurs exactly once in array A.
// The function should return −1 if there are no unique numbers in A.
func firstUnique(_ A: inout [Int]) -> Int {
    guard A.count > 0 && A.count < 100_000 else {
        return -1
    }
    guard A.filter({$0 > -1 && $0 < 1_000_000_000}).count > 0 else {
        return -1
    }
    for number in A {
        let results = A.filter({$0 == number})
        if results.count == 1 {
           return results[0]
        }
        continue
    }
    return -1
}

let result = firstUnique(&test4)


