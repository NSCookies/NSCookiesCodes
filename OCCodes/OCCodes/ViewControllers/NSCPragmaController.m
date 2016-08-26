//
//  NSCPragmaController.m
//  OCCodes
//
//  Created by Pluto Y on 8/26/16.
//  Copyright © 2016 nscookies. All rights reserved.
//

#import "NSCPragmaController.h"

@interface NSCPragmaController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NSCPragmaController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAll];
}

#pragma mark Custom functions
- (void)initAll {
    self.title = @"#pragma与 // MARK:";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
#pragma message "This is a warning"
#warning "This is another warning"
    
}

#pragma mark - UITableViewDataSources
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
    int unusedInt;
#pragma clang diagnostic pop
    
    NSString *unsedString;
#pragma unused(unsedString)
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了%li行", indexPath.row);
}


@end
