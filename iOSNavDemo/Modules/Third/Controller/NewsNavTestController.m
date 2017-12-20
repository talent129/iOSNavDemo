//
//  NewsNavTestController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/20.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "NewsNavTestController.h"

@interface NewsNavTestController ()

@end

@implementation NewsNavTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"导航";
    [self createUI];
}

- (void)createUI
{
    for (int i = 0; i < 3; i ++) {
        UITableViewController *tableVC = [[UITableViewController alloc] initWithStyle:UITableViewStyleGrouped];
        
        [self addChildViewController:tableVC];
    }
    NSLog(@"--%@", self.childViewControllers);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
