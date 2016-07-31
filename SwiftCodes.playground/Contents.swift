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


