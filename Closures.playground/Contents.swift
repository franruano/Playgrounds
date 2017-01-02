//: Playground - noun: a place where people can play

import UIKit

//https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})


//Inferring Type From Context
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
reversedNames = names.sorted(by: { $0 > $1 } )


//Operator Methods
reversedNames = names.sorted(by: >)


//Trailing Closures
reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]


//Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()

//Closures Are Reference Types

// ******* https://www.weheartswift.com/closures/ **********
var multipleParametersAndReturnValue =
    { (first: String, second: String) -> String in
        return first + " " + second
}
multipleParametersAndReturnValue("John", "Doe")


//MAP go through all the sequence and return an array
let dic: [String: Any?] = ["uno":"I have", "dos": 1, "tres": "dog", "cuatro":nil]
let arrReturn = dic.map({ (key, value) in
    value
})
print(arrReturn)

let arrReturn2 = dic
            .filter({ (key, value) in value != nil })
            .map({ (key, value) in value })
print(arrReturn2)

let arrReturn3 = dic
    .filter({ (key, value) in value != nil })
    .map({ (key, value) in String(describing: value!) })
    .reduce("") { $0 + " " + $1 }
print(arrReturn3)


