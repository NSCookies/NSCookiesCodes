//
//  NSCMethodChainController.m
//  OCCodes
//
//  Created by Pluto Y on 8/30/16.
//  Copyright © 2016 nscookies. All rights reserved.
//

#import "NSCMethodChainController.h"

@interface NSCStudent : NSObject

- (instancetype)study;
- (instancetype)play;
- (NSCStudent * (^)(NSString *))playWith;

@end

@implementation NSCStudent

- (instancetype)study {
    NSLog(@"The student study");
    return self;
}

- (instancetype)play {
    NSLog(@"The student play");
    return self;
}

- (NSCStudent * (^)(NSString *))playWith {
    return ^id(NSString *name) {
        NSLog(@"The student play with %@", name);
        return self;
    };
}

@end

@interface NSCMethodChainController ()

@end

@implementation NSCMethodChainController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSCStudent *student = [[NSCStudent alloc] init];
    // 也可以通过 student.study.play;
    [[student study] play];
    // 如果带参数的情况下就不可以用.来调用了
    // student.study.playWith
    
    //通过返回Block后
    student.study.playWith(@"Girl");
    //student.study.playWith(@"Girl1").playWith(@"Girl2").playWith(@"Girl3").playWith(@"Girl4").playWith(@"Girl5")
    student.study.playWith(@"Girl1").playWith(@"Girl2").playWith(@"Girl3").playWith(@"Girl4").playWith(@"Girl5");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
