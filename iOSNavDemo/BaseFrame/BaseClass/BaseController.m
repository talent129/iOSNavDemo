//
//  BaseController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()

/**
 1. 给导航栏颜色方式设置导航栏: 导航栏底部存在黑线
 */
@property (nonatomic, strong) UIImageView *navBarHorLineView;

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
    
    self.view.backgroundColor = COLOR(@"#efefef");
    
    [self navigationStyle];
    
    [self zjsLeftBarButtonItem];
}

#pragma mark -导航栏风格
- (void)navigationStyle
{
    //隐藏导航栏底部黑线
    _navBarHorLineView = [self findHorLine:self.navigationController.navigationBar];
    _navBarHorLineView.hidden = YES;
}

#pragma mark -拿到导航栏底部黑线
- (UIImageView *)findHorLine:(UIView *)view
{
    if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    
    for (UIView *subView in view.subviews) {
        UIImageView *imageView = [self findHorLine:subView];
        if (imageView) {
            return imageView;
        }
    }
    
    return nil;
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
