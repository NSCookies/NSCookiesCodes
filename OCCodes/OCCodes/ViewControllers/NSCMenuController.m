//
//  NSCMenuController.m
//  Codes
//
//  Created by Pluto Y on 7/26/16.
//  Copyright © 2016 nscookies. All rights reserved.
//

#import "NSCMenuController.h"
#import "NSCVariadicFunctionController.h"
#import "NSCTaggedPointerController.h"

@interface NSCMenuController ()

@end

@implementation NSCMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *controller = nil;
    switch (indexPath.row) {
        case 0: // 可变参数
            controller = [[NSCVariadicFunctionController alloc] init];
            break;
        case 1: // Tagged Pointer
            controller = [[NSCTaggedPointerController alloc] init];
            break;
        default:
            break;
    }
    if (controller) {
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
