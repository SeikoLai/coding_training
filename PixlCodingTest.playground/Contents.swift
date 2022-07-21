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

