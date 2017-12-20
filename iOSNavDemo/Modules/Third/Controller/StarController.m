//
//  StarController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/20.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "StarController.h"
#import "StarView.h"

@interface StarController ()

@end

@implementation StarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"评分";
    StarView *star = [[StarView alloc] initWithFrame:CGRectMake(10, 100, 100, 20)];
    star.rate = 8;
    [self.view addSubview:star];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
