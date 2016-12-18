//: Playground - noun: a place where people can play

import UIKit

func adderInt(x: Int, y: Int) -> Int {
    return x + y
}
let intSum = adderInt(x: 1, y: 2)


func adderDouble(x: Double, y: Double) -> Double {
    return x + y
}
let doubleSum = adderDouble(x: 1.0, y: 2.0)


let numbers = [1, 2, 3]
let firstNumber = numbers[0]


var numbersAgain = Array<Int>()
numbersAgain.append(1)
numbersAgain.append(2)
numbersAgain.append(3)

let firstNumberAgain = numbersAgain[0]

//numbersAgain.append("hello") //It would fail

let countryCodes = ["Austria": "AT", "United States of America": "US", "Turkey": "TR"]
let at = countryCodes["Austria"]

let optionalName = Optional<String>.some("John")

if let name = optionalName {
    print(name)
}


// Generic functions
func pairsFromDictionary<KeyType, ValueType>(dictionary: [KeyType: ValueType]) -> [(KeyType, ValueType)]
{
    return Array(dictionary)
}
let pairs = pairsFromDictionary(dictionary: ["minimum": 199, "maximum": 299])
let morePairs = pairsFromDictionary(dictionary: [1: "Swift", 2: "Generics", 3: "Rule"])


//Structures
struct Queue<Element: Equatable> {
    fileprivate var elements = [Element]()
    
    mutating func enqueue(newElement: Element) {
        elements.append(newElement)
    }
    
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.remove(at: 0)
    }
}
var q = Queue<Int>()
q.enqueue(newElement: 4)
q.enqueue(newElement: 2)
q.dequeue()
q.dequeue()
q.dequeue()
q.dequeue()


// Advance topics
func mid<T>(array: [T]) -> T
    where T: Comparable {
    return array.sorted()[(array.count - 1) / 2]
}
mid(array: [3, 5, 1, 2, 4])


protocol Summable { static func +(lhs: Self, rhs: Self) -> Self }

extension Int: Summable {}
extension Double: Summable {}
extension String: Summable {}

func adder<T: Summable>(x: T, y: T) -> T {
    return x + y
}
let adderIntSum = adder(x: 1, y: 2)
let adderDoubleSum = adder(x: 1.0, y: 2.0)
let adderStringSum = adder(x: "Hello ", y: "John")

extension Queue {
    func peek() -> Element? {
        return elements.first
    }
}

q.enqueue(newElement: 5)
q.enqueue(newElement: 3)
q.peek()


extension Queue {
    func homogeneous() -> Bool {
        if let first = elements.first {
            return !elements.contains { $0 != first }
        }
        return true
    }
}

q.homogeneous()



// Some new features
//Inheritance
class Box<T> {
    
}

class Gift<T>: Box<T> {
    
}

class StringBox: Box<String> {
    
}

let box = Box<Int>()
let gift = Gift<Double>()
let stringBox = StringBox()

// Enums
enum Result<ValueType, ErrorType> {
    case Success(ValueType)
    case Failure(ErrorType)
}

func divideOrError(x: Int, y: Int) -> Result<Int, String> {
    guard y != 0 else {
        return Result.Failure("Division by zero is undefined")
    }
    return Result.Success(x / y)
}

let result1 = divideOrError(x: 42, y: 2)
let result2 = divideOrError(x: 42, y: 0)



// Following other work from Apple
func swapTwoValues<T: NSSet>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

func findIndex<T: Equatable> (of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
}
let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
// doubleIndex is an optional Int with no value, because 9.3 is not in the array
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
// stringIndex is an optional Int containing a value of 2


//Protocols
protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    
    typealias ItemType = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stack<Element>: Container {
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}


// Exensions



