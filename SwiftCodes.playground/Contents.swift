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
