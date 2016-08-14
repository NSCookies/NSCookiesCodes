//
//  NSCMethodSwizzlingController.m
//  OCCodes
//
//  Created by Pluto Y on 8/14/16.
//  Copyright © 2016 nscookies. All rights reserved.
//

#import "NSCMethodSwizzlingController.h"
#import <objc/runtime.h>

@interface MethodSwizzlingDemo : NSObject

+ (void)swizzleWithOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL) swizzledSelector isClassMethod:(BOOL)isClassMethod;

- (void)methodOrigin;
- (void)methodSizzled;

@end

@implementation MethodSwizzlingDemo

+ (void)swizzleWithOriginalSelector:(SEL)originalSelector swizzledSelector:(SEL) swizzledSelector isClassMethod:(BOOL)isClassMethod
{
    Class cls = [self class];
    
    Method originalMethod;
    Method swizzledMethod;
    
    if (isClassMethod) {
        originalMethod = class_getClassMethod(cls, originalSelector);
        swizzledMethod = class_getClassMethod(cls, swizzledSelector);
    } else {
        originalMethod = class_getInstanceMethod(cls, originalSelector);
        swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    }
    
    if (!originalMethod) {
        NSLog(@"Error: originalMethod is nil, did you spell it incorrectly? %@", originalMethod);
        return;
    }
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)methodOrigin {
    NSLog(@"%s", __FUNCTION__);
}

- (void)methodSizzled {
    NSLog(@"%s", __FUNCTION__);
}

@end

@interface NSCMethodSwizzlingController ()

@end

@implementation NSCMethodSwizzlingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAll];
}

- (void)initAll {
    self.title = @"黑魔法之Method Swizzling";
    MethodSwizzlingDemo *methodSizzling = [MethodSwizzlingDemo new];
    NSLog(@"Before swizzle method");
    NSLog(@"methodOrigin pointer :%p", class_getMethodImplementation([MethodSwizzlingDemo class], @selector(methodOrigin)));
    NSLog(@"methodSizzled pointer :%p", class_getMethodImplementation([MethodSwizzlingDemo class], @selector(methodSizzled)));
    [methodSizzling methodOrigin];
    [methodSizzling methodSizzled];
    
    NSLog(@"------------------------------------------------------------------------------------");
    [MethodSwizzlingDemo swizzleWithOriginalSelector:@selector(methodOrigin) swizzledSelector:@selector(methodSizzled) isClassMethod:NO];
    NSLog(@"After swizzle method");
    NSLog(@"methodOrigin pointer :%p", class_getMethodImplementation([MethodSwizzlingDemo class], @selector(methodOrigin)));
    NSLog(@"methodSizzled pointer :%p", class_getMethodImplementation([MethodSwizzlingDemo class], @selector(methodSizzled)));
    [methodSizzling methodOrigin];
    [methodSizzling methodSizzled];
}

@end
