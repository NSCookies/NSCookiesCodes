//
//  NSCEnumController.m
//  OCCodes
//
//  Created by Pluto Y on 9/5/16.
//  Copyright © 2016 nscookies. All rights reserved.
//

#import "NSCEnumController.h"

//#if (__cplusplus && __cplusplus >= 201103L      \
//        && (__has_extension(cxx_strong_enums)   \
//        || __has_feature(objc_fixed_enum))      \
//    ) ||                                        \
//    (!__cplusplus && __has_feature(objc_fixed_enum))
//        #define NS_ENUM(_type, _name) enum _name : _type _name; enum _name : _type
//    #if (__cplusplus)
//        #define NS_OPTIONS(_type, _name) _type _name; enum : _type
//    #else
//        #define NS_OPTIONS(_type, _name) enum _name : _type _name; enum _name : _type
//    #endif
//#else
//    #define NS_ENUM(_type, _name) _type _name; enum
//    #define NS_OPTIONS(_type, _name) _type _name; enum
//#endif

typedef enum : NSUInteger {
    MyEnumValueA,
    MyEnumValueB,
    MyEnumValueC,
} MyEnum;

typedef NS_ENUM(NSUInteger, MyNSEnum) {
    MyNSEnumValue1,
    MyNSEnumValue2,
    MyNSEnumValue3,
    MyNSEnumValue4
};

typedef NS_OPTIONS(NSUInteger, MyNSOptions) {
    MyNSOptionsValue1           = 1<<0,
    MyNSOptionsValue2           = 1<<1,
    MyNSOptionsValue3           = 1<<2,
    MyNSOptionsValue4           = 1<<3,
    MyNSOptionsValue5           = 1<<4
};

//typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
//    UIViewAutoresizingNone                 = 0,
//    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
//    UIViewAutoresizingFlexibleWidth        = 1 << 1,
//    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
//    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
//    UIViewAutoresizingFlexibleHeight       = 1 << 4,
//    UIViewAutoresizingFlexibleBottomMargin = 1 << 5
//};

@interface NSCEnumController ()

@end

@implementation NSCEnumController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyNSEnum currentVersion;
    switch (currentVersion) {
        case MyNSEnumValue1:
            break;
    }
}

@end
