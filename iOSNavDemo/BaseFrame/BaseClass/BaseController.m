//
//  BaseController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()

@end

@implementation BaseController

#pragma mark -lazy load
- (UIButton *)backButton
{
    if (!_backButton) {
        _backButton= [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(0, 0, 64, 44);
        [_backButton setImage:[UIImage imageNamed:@"navLeft"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"navLeft"] forState:UIControlStateHighlighted];
        _backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 50);
        [_backButton addTarget:self action:@selector(zjsLeftBarButtonItemAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ///取消自动偏移
    if (!([[UIDevice currentDevice].systemVersion floatValue] >= 11.0)) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    self.view.backgroundColor = kVCViewColor;
    
    [self zjsLeftBarButtonItem];
}

#pragma mark -左侧返回按钮
- (void)zjsLeftBarButtonItem
{
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
    }
}

- (void)zjsLeftBarButtonItemAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -收起键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (void)dealloc
{
    NSLog(@"--dealloc: %@", NSStringFromClass([self class]));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
