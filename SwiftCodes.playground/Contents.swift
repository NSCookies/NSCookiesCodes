//: Playground - noun: a place where people can play

import Foundation

// MARK: 可变参数
func sumAllValues(nums: Float...) -> Float {
    var sum: Float = 0.0
    for num in nums {
        sum += num
    }
    return sum
}

sumAllValues(5.0, 4.0, 5.0, 3.3)


// MARK: Tagged Pointer
let num1 = NSNumber(long: 0xffff)
let num2 = NSNumber(long: 0xffff)
let pointFormatStr1 = NSString(format: "tagged point :%p", num1)
let pointFormatStr2 = NSString(format: "tagged point :%p", num2)


let num3 = NSNumber(float: Float(M_PI))
let num4 = NSNumber(float: Float(M_PI))
let pointFormatStr3 = NSString(format: "tagged point :%p", num3)
let pointFormatStr4 = NSString(format: "tagged point :%p", num4)

let date1 = NSDate(timeIntervalSince1970: 10)
let date2 = NSDate(timeIntervalSince1970: 10)
let pointFormatStr5 = NSString(format: "tagged point :%p", date1)
let pointFormatStr6 = NSString(format: "tagged point :%p", date2)

let date3 = NSDate(timeIntervalSinceNow: 10)
let date4 = NSDate(timeIntervalSinceNow: 10)
let pointFormatStr7 = NSString(format: "tagged point :%p", date3)
let pointFormatStr8 = NSString(format: "tagged point :%p", date4)

// MARK: 字面量(Literal)
let aString = "World"
let aNumber = 6
let aBool = false
let arr = ["Hello", "World"]
let dic = ["key1": "value1", "key2": "value2"]

// Swift 字面量转换协议
class NSCPerson : StringLiteralConvertible {
    let name: String
    
    init(withName name: String) {
        self.name = name
    }
    
    required convenience init(stringLiteral value: String) {
        self.init(withName:value)
    }
    
    required convenience init(unicodeScalarLiteral value: String) {
        self.init(withName:value)
    }
    
    required convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(withName:value)
    }
    
}

let person: NSCPerson = "NSCookies"
print("person.name:\(person.name)")

// MARK: 链式编程(Method chaining)
struct NSCStudent {
    func study() -> NSCStudent {
        print("The student study")
        return self
    }
    
    func playWith(name: String) -> NSCStudent {
        print("The student play with \(name)")
        return self
    }
}

let student = NSCStudent()
student.study().playWith("Girl")

// MARK: 枚举（Enum）

// Swift 1.2 RawOptionSetType
//struct <# Options #> : RawOptionSetType, BooleanType {
//    let rawValue: UInt
//    init(nilLiteral: ()) { self.value = 0 }
//    init(_ value: UInt = 0) { self.value = value }
//    init(rawValue value: UInt) { self.value = value }
//    var boolValue: Bool { return value != 0 }
//    var rawValue: UInt { return value }
//    static var allZeros: <# Options #> { return self(0) }
//    
//    static var None: <# Options #>         { return self(0b0000) }
//    static var <# Option #>: <# Options #>     { return self(0b0001) }
//    // ...
//}

// Swift 2.2 OptionSetType
struct NSCOptions : OptionSetType {
    let rawValue: UInt
    static let None = NSCOptions(rawValue: 0)
    static let Value1 = NSCOptions(rawValue: 0b0001)
    static let Value2 = NSCOptions(rawValue: 0b0010)
    static let Value3 = NSCOptions(rawValue: 0b0100)
    static let Value4 = NSCOptions(rawValue: 0b1000)
}




