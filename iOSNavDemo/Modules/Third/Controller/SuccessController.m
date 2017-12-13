//
//  SuccessController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/13.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "SuccessController.h"
#import "SuccessView.h"

@interface SuccessController ()

@end

@implementation SuccessController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"勾号动画";
    
    SuccessView *suc = [[SuccessView alloc] initWithFrame:CGRectMake(SCREEN_Width/2.0 - 30, 100, 60, 60)];
    [self.view addSubview:suc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
