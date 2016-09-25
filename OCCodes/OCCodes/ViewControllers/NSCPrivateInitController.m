//
//  NSCPrivateInitController.m
//  OCCodes
//
//  Created by Pluto Y on 26/09/2016.
//  Copyright © 2016 nscookies. All rights reserved.
//

#import "NSCPrivateInitController.h"

@interface NSCSingleDogFactory : NSObject

// 第一种方法,通过attribute中的unavailable来实现
//- (instancetype)init __attribute__((unavailable("Disabled. Use +sharedInstance instead")));
// 第二种方式，通过NS_UNAVAILABLE
//- (instancetype)init NS_UNAVAILABLE;
// 第二种方式等价于以下两种
//- (instancetype)init __attribute__((unavailable));
//- (instancetype) __unavailable init;
+ (instancetype)sharedInstance;

@end

@implementation NSCSingleDogFactory

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static NSCSingleDogFactory *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

// 第三种方法，通过调用doesNotRecognizeSelector来搞定
//- (instancetype)init {
//    [super doesNotRecognizeSelector:_cmd];
//    return nil;
//}

// 第四种方式，在init防范重通过断言和异常来搞定
//- (instancetype)init {
//    // 可以通过断言
//    NSAssert(false,@"unavailable, use sharedInstance instead");
//    // 或者 通过异常
////    [NSException raise:NSGenericException
////                format:@"Disabled. Use +[%@ %@] instead",
////     NSStringFromClass([self class]),
////     NSStringFromSelector(@selector(sharedInstance))];
//    return nil;
//}

@end

@interface NSCPrivateInitController ()

@end

@implementation NSCPrivateInitController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSCSingleDogFactory *factory = [[NSCSingleDogFactory alloc] init];
    
    
    
#pragma unused(factory)
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
