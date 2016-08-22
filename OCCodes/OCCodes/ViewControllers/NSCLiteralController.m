//
//  NSCLiteralController.m
//  OCCodes
//
//  Created by Pluto Y on 8/22/16.
//  Copyright © 2016 nscookies. All rights reserved.
//

#import "NSCLiteralController.h"
#import <objc/runtime.h>

typedef NS_ENUM(NSInteger, NSCLietralEnum) {
    NSCLietralEnum1,
    NSCLietralEnum2,
    NSCLietralEnum3,
    NSCLietralEnum4
};

typedef struct __attribute__((objc_boxable)) _NSCPosition {
    float x, y;
} NSCPosition;

@interface NSCSubscriptableObject : NSObject

//  Object subscripting
- (id)objectForKeyedSubscript:(id <NSCopying>)key;
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key;

@end

@implementation NSCSubscriptableObject {
    NSMutableDictionary     *_dictionary;
}

- (id)init {
    self = [super init];
    if (self) {
        _dictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id)objectForKeyedSubscript:(id <NSCopying>)key {
    return _dictionary[key];
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key {
    _dictionary[key] = obj;
}

@end

@interface NSCLiteralController ()

@end

@implementation NSCLiteralController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"字面量(Literal)";
    
    // Objective-C
    NSString *aString = @"Hello";
    NSNumber *aNumber = @5;
    NSLog(@"%@", NSStringFromClass(object_getClass(aNumber)));
    BOOL aBool = YES;
    NSArray *arr = @[@"Hello", @"World"];
    NSDictionary *dic = @{@"key1": @"value1", @"key2": @"value2"};
    
    // Boxed Expressions
    NSNumber *piOverTwo = @(M_PI / 2);
    NSNumber *favoriteColor = @(NSCLietralEnum1);
    NSCPosition pos;
    NSValue *pos2 = @(pos);
    
    // 下标
    NSString *strFromArr = arr[0];
    NSString *valFromDic = dic[@"key1"];
    
    // 自定义下标
    NSCSubscriptableObject *subsObj = [[NSCSubscriptableObject alloc] init];
    
    subsObj[@"string"] = @"Value 1";
    subsObj[@"number"] = @2;
    subsObj[@"array"] = @[@"Arr1", @"Arr2", @"Arr3"];
    
    NSLog(@"String: %@", subsObj[@"string"]);
    NSLog(@"Number: %@", subsObj[@"number"]);
    NSLog(@"Array: %@", subsObj[@"array"]);
    
}

@end
