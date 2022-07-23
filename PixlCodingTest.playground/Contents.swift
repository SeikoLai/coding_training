import Foundation
var test1 = [4, 10, 5, 4, 2, 10] // 5
var test2 = [1, 4, 3, 3, 1, 2] // 4
var test3 = [6, 4, 4, 6] // -1
var test4 = [-10]


/// A non-empty array A consisting of N integers is given. The unique number is the number that occurs exactly once in array A.
/// The function should return −1 if there are no unique numbers in A.
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


var strSymmetryPointTest1 = "racecar"
var strSymmetryPointTest2 = "x"
var strSymmetryPointTest3 = ""

/// that, given a string S, returns the index (counting from 0) of a character such that the part of the string to the left of that character is a reversal of the part of the string to its right. The function should return −1 if no such index exists.
///
/// Note: reversing an empty string (i.e. a string whose length is zero) gives an empty string.
///
/// Given a string:
/// "x"
/// the function should return 0, because both substrings are empty.
///
/// Write an efficient algorithm for the following assumptions:
/// the length of string S is within the range [0..2,000,000].
func strSymmetryPoint(_ s: inout String) -> Int {
    // Check value range
    guard s.count > -1 && s.count < 2_000_000 else {
        return -1
    }
    
    // Check for invalid value
    guard s.count % 2 != 0 else {
        return -1
    }
    
    // Avoid changing the original value
    let string = s
    
    // Get the center value
    let center = string.count / 2
    
    // Get the center index
    let centerIndex = string.index(string.startIndex, offsetBy: center)
    
    // Get the center character
    let char = string[centerIndex]
    
    // Split string using center character and save into array
    let splitStrings = string.split(separator: char)
    
    // Make sure to get the first part of the string and the last part of the string
    if let first = splitStrings.first,
       let last = splitStrings.last {
        
        // Verify that the first part of the string is equal to the reversed string of the last part, then return the center index for success, otherwise return 0
        return first == String(last.reversed()) ? center : 0
    }
    return 0
}

let strSymmetryPointResult = strSymmetryPoint(&strSymmetryPointTest1)


//// (5, (3, (20, None, None), (21, None, None)), (10, (1, None, None), None))
//
//// Data structure
//class Tree {
//    var x: Int = 0
//    var l: Tree?
//    var r: Tree?
//    init() {}
//}
//
//// Test object
//func createTree(_ s: String) -> Tree? {
//    return Tree()
//}
//
///// A non-empty tree is represented by a pointer to an object representing its root. The attribute x holds the integer contained in the root, whereas attributes l and r hold the left and right subtrees of the binary tree, respectively.
//func treeHeight(_ T: Tree?) -> Int? {
//    // An empty tree is represented by an empty pointer (denoted by nil).
//    guard T != nil else {
//        return nil
//    }
//    return 0
//}


func findOneInBinary(_ A: Int, _ B: Int) -> Int {
    // assume
    guard  A * B > 0 && A * B < 100_000_000 else {
        return 0
    }
    let number = A * B
    // convert string to binary
    let string = String(number, radix: 2)
    // get string length
    let length = string.count
    // used to shift index
    var index = 0
    // calculate the true value times
    var count = 0
    while index < length {
        // get char index
        let stringIndex = string.index(string.startIndex, offsetBy: index)
        // compare char at index is equal "1" or not then decide add 1 or 0 to the count
        count = string[stringIndex] == "1" ? count + 1 : count
        // increment index to shift binary
        index = index + 1
    }
    return count
}

let findOneInBinaryResult1 = findOneInBinary(3, 7)
let findOneInBinaryResult2 = findOneInBinary(7, 500000000)

var noInstanceOfThreeIdenticalConsecutiveLettersTest1 = "baaaaa"
var noInstanceOfThreeIdenticalConsecutiveLettersTest2 = "baaabbaabbba"

func noInstanceOfThreeIdenticalConsecutiveLetters(_ S: inout String) -> Int {
    // prepare assume
    let string = S
    let range = NSRange(location: 0, length: string.utf16.count)
    let regex = try! NSRegularExpression(pattern: "[a|b]")
    // assume
    guard regex.firstMatch(in: string, range: range) != nil else {
        return 0
    }
    guard string.count > -1 && string.count < 200_000 else {
        return 0
    }
    
    let length = string.count
    // used to shift index
    var index = 0
    // calculate the same char times
    var match = 0
    // if the same char times equal 2, the count plus 1
    var changeCount = 0
    var char: Character?
    while index < length {
        // get string index
        let currentIndex = string.index(string.startIndex, offsetBy: index)
        // if current sting is the same char then match plus 1
        if string[currentIndex] == char {
            match = match + 1
        }
        // assign current string to char
        char = string[currentIndex]
        // if match the same char three times
        if match == 3 {
            // let the match equal to 0 recalculate match count
            match = 0
            // change alphabet count plus 1
            changeCount = changeCount + 1
        }
        // increment index to get next char
        index = index + 1
    }
    
    return changeCount
}

let noInstanceOfThreeIdenticalConsecutiveLettersResult = noInstanceOfThreeIdenticalConsecutiveLetters(&noInstanceOfThreeIdenticalConsecutiveLettersTest2)
