//
//  NSCTaggedPointerController.m
//  OCCodes
//
//  Created by Pluto Y on 7/31/16.
//  Copyright © 2016 nscookies. All rights reserved.
//

#import "NSCTaggedPointerController.h"

@interface NSCTaggedPointerController ()

@end

@implementation NSCTaggedPointerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tagged Pointer";
    
    NSNumber *num1 = [NSNumber numberWithInt:10];
    NSNumber *num2 = [NSNumber numberWithInt:10];
    NSLog(@"pointer of num 1: %p, retain count: %li", num1, [num1 retainCount]);
    NSLog(@"pointer of num 2: %p, retain count: %li", num2, [num2 retainCount]);
    
    NSNumber *num3 = [NSNumber numberWithInt:0xfffff];
    NSNumber *num4 = [NSNumber numberWithInt:0xfffff];
    NSLog(@"pointer of num 3: %p, retain count: %li", num3, [num3 retainCount]);
    NSLog(@"pointer of num 4: %p, retain count: %li", num4, [num4 retainCount]);
    
    NSNumber *num5 = [NSNumber numberWithDouble:M_PI];
    NSNumber *num6 = [NSNumber numberWithDouble:M_PI];
    NSLog(@"pointer of num 5: %p, retain count: %li", num5, [num5 retainCount]);
    NSLog(@"pointer of num 6: %p, retain count: %li", num6, [num6 retainCount]);
    
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:10];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:10];
    NSLog(@"pointer of date 1: %p, retaint count: %li", date1, [date1 retainCount]);
    NSLog(@"pointer of date 2: %p, retaint count: %li", date2, [date2 retainCount]);
    
    NSDate *date3 = [NSDate dateWithTimeIntervalSince1970:16];
    NSDate *date4 = [NSDate dateWithTimeIntervalSince1970:16];
    NSLog(@"pointer of date 3: %p, retaint count: %li", date3, [date3 retainCount]);
    NSLog(@"pointer of date 4: %p, retaint count: %li", date4, [date4 retainCount]);
    
    NSDate *date5 = [NSDate dateWithTimeIntervalSinceNow:16];
    NSDate *date6 = [NSDate dateWithTimeIntervalSinceNow:16];
    NSLog(@"pointer of date 5: %p, retaint count: %li", date5, [date5 retainCount]);
    NSLog(@"pointer of date 6: %p, retaint count: %li", date6, [date6 retainCount]);
}

@end
