//
//  NSCVariadicFunctionController.m
//  Codes
//
//  Created by Pluto Y on 7/26/16.
//  Copyright © 2016 nscookies. All rights reserved.
//

#import "NSCVariadicFunctionController.h"

@interface NSCVariadicFunctionController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLbl;
@property (weak, nonatomic) IBOutlet UITextView *codeTf;

@end

@implementation NSCVariadicFunctionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"可变参数";
    [self initAll];
}

-(void)initAll {
    self.view.backgroundColor = [UIColor whiteColor];
    _codeTf.text = @"// 调用\nNSNumber *sumResult = [self sumAllValues:@5.0, @4.0, @5.0, @3.3]\n\n// 可变参数的实现\n-(NSNumber *)sumAllValues:(NSNumber *)initValue, ... {\n    va_list args;\n    va_start(args, initValue);\n    NSNumber *arg = va_arg(args, NSNumber *);\n    NSNumber *result = initValue;\n    float sum = [result floatValue];\n    while (arg != nil) {\n        sum += [arg floatValue];\n        arg = va_arg(args, NSNumber *);\n    }\n    va_end(args);\n    return result;\n}";
}

- (IBAction)calculateClick:(id)sender {
    // 调用可变参数的方法
    NSNumber *sumResult = [self sumAllValues:@5.0, @4.0, @5.0, @3.3];
    _resultLbl.text = [NSString stringWithFormat:@"结果是:%.1f", [sumResult floatValue]];
    _resultLbl.hidden = NO;
}

// 可变参数的实现
-(NSNumber *)sumAllValues:(NSNumber *)initValue, ... {
    va_list args; // 1.
    va_start(args, initValue); // 2.
    NSNumber *arg = va_arg(args, NSNumber *); // 3.
    NSNumber *result = initValue;
    float sum = [result floatValue];
    while (arg != nil) {
        sum += [arg floatValue];
        arg = va_arg(args, NSNumber *); // 4.
    }
    va_end(args); // 5.
    result = @(sum);
    return result;
}

@end
