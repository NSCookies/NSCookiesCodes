//
//  NSCIsaSwizzlingController.m
//  OCCodes
//
//  Created by Pluto Y on 8/14/16.
//  Copyright © 2016 nscookies. All rights reserved.
//

#import "NSCIsaSwizzlingController.h"
#import <objc/runtime.h>

@interface Person : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger age;

- (void)printInfo;

@end

@implementation Person

- (void)printInfo {
    NSLog(@"isa:%@, supper class:%@", NSStringFromClass(object_getClass(self)), class_getSuperclass(object_getClass(self)));
    NSLog(@"self:%@, [self superclass]:%@", self, [self superclass]);
    NSLog(@"age setter function pointer:%p", class_getMethodImplementation(object_getClass(self), @selector(setAge:)));
    NSLog(@"age getter function pointer:%p", class_getMethodImplementation(object_getClass(self), @selector(age)));
    NSLog(@"name setter function pointer:%p", class_getMethodImplementation(object_getClass(self), @selector(setName:)));
    NSLog(@"printInfo function pointer:%p", class_getMethodImplementation(object_getClass(self), @selector(printInfo)));
    
}

@end

static void const *PrivateKVOContext;

@interface NSCIsaSwizzlingController ()

@property (nonatomic, strong) Person *person;

@end

@implementation NSCIsaSwizzlingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAll];
}

- (void)initAll {
    self.title = @"isa-swizzling?什么鬼？";
    Person *person = [[Person alloc] init];
    NSLog(@"Before add observer--------------------------------------------------------------------------");
    [person printInfo];
    [person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:&PrivateKVOContext];
    NSLog(@"After add observer--------------------------------------------------------------------------");
    [person printInfo];
    
    [person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:&PrivateKVOContext];
    NSLog(@"After add observer--------------------------------------------------------------------------");
    [person printInfo];
    [person removeObserver:self forKeyPath:@"name"];
    [person removeObserver:self forKeyPath:@"age"];
    NSLog(@"After remove observer--------------------------------------------------------------------------");
    [person printInfo];
    [person removeObserver:self forKeyPath:@"age"];
    person.age = 123;
//    [person removeObserver:self forKeyPath:@"age"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == &PrivateKVOContext) {
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
