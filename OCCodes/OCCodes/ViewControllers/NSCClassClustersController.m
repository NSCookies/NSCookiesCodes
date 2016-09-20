//
//  NSCClassClustersController.m
//  OCCodes
//
//  Created by Pluto Y on 9/20/16.
//  Copyright © 2016 nscookies. All rights reserved.
//

#import "NSCClassClustersController.h"
#import <objc/runtime.h>

@interface NSCClassClustersController ()

@end

@implementation NSCClassClustersController

- (void)viewDidLoad {
    [super viewDidLoad];
    id btn = [UIButton buttonWithType:UIButtonTypeCustom];
    id btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [btn setTitle:@"123" forState:UIControlStateNormal];
    [btn1 setTitle:@"123" forState:UIControlStateNormal];
    
    // 设置断点 breakpoint set -F '+[UIButton buttonWithType:]'

    // 来自 http://blog.sunnyxx.com/2014/12/18/class-cluster/
//    id obj1 = [NSArray alloc]; // __NSPlacehodlerArray *
//    id obj2 = [NSMutableArray alloc];  // __NSPlacehodlerArray *
//    id obj3 = [obj1 init];  // __NSArrayI *
//    id obj4 = [obj2 init];  // __NSArrayM *
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
