//
//  NSCIsKindOfClsController.m
//  OCCodes
//
//  Created by Pluto Y on 8/8/16.
//  Copyright © 2016 nscookies. All rights reserved.
//

#import "NSCIsKindOfClsController.h"
#import <objc/runtime.h>

//@interface NSObject(Detail)
//
//+ (BOOL)isMemberOfClass:(Class)cls;
//- (BOOL)isMemberOfClass:(Class)cls;
//+ (BOOL)isKindOfClass:(Class)cls;
//- (BOOL)isKindOfClass:(Class)cls;
//
//@end
//
//@implementation NSObject(Detail)
//
//+ (BOOL)isMemberOfClass:(Class)cls {
//    return object_getClass((id)self) == cls;
//}
//
//- (BOOL)isMemberOfClass:(Class)cls {
//    return [self class] == cls;
//}
//
//+ (BOOL)isKindOfClass:(Class)cls {
//    for (Class tcls = object_getClass((id)self); tcls; tcls = class_getSuperclass(tcls)) {
//        if (tcls == cls) return YES;
//    }
//    return NO;
//}
//
//- (BOOL)isKindOfClass:(Class)cls {
//    for (Class tcls = [self class]; tcls; tcls = class_getSuperclass(tcls)) {
//        if (tcls == cls) return YES;
//    }
//    return NO;
//}
//
//@end

@interface Pluto : NSObject

@end

@implementation Pluto

@end

@interface NSCIsKindOfClsController ()

@end

@implementation NSCIsKindOfClsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"isKindOfClass";
    
    
    BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
    NSLog(@"res1---->%@",res1?@"YES":@"NO");
    BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
    NSLog(@"res2---->%@",res2?@"YES":@"NO");
    BOOL res3 = [(id)[Pluto class] isKindOfClass:[Pluto class]];
    NSLog(@"res3---->%@",res3?@"YES":@"NO");
    BOOL res4 = [(id)[Pluto class] isMemberOfClass:[Pluto class]];
    NSLog(@"res4---->%@",res4?@"YES":@"NO");
    
    BOOL res5 = [NSObject class] == [[NSObject class] class];
    NSLog(@"res5---->%@",res5?@"YES":@"NO");
    BOOL res6 = [NSObject class] == [[[NSObject class] class] class];
    NSLog(@"res6---->%@",res6?@"YES":@"NO");
    BOOL res7 = [NSObject class] == object_getClass([NSObject class]);
    NSLog(@"res7---->%@",res7?@"YES":@"NO");
    BOOL res8 = object_getClass([NSObject class]) == object_getClass(object_getClass([NSObject class]));
    NSLog(@"res8---->%@",res8?@"YES":@"NO");
    BOOL res9 = [NSObject class] == class_getSuperclass(object_getClass([NSObject class]));
    NSLog(@"res9---->%@",res9?@"YES":@"NO");
}


@end
