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

//添加右侧按钮
- (void)rightButtonWithTitle:(NSString *)title andHandle:(RightBtnBlock)block
{
    [self.rightBtn setTitle:title forState:UIControlStateNormal];
    
    [self.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.rightBtn setTitleColor:COLOR(@"#999999") forState:UIControlStateHighlighted];
    self.rightBtn.titleLabel.font = Font(15);
    if (title.length > 2) {
        self.rightBtn.frame = CGRectMake(0, 0, 100, 44);
    }else {
        self.rightBtn.frame = CGRectMake(0, 0, 40, 44);
    }
    
    if (IOS7_OR_LATER) {
        if (title.length > 2) {
            self.rightBtn.titleEdgeInsets = UIEdgeInsetsMake(10, 30, 0, -5);
        }else {
            self.rightBtn.titleEdgeInsets = UIEdgeInsetsMake(10, 10, 0, 0);
        }
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    
    self.rightBtnBlock = block;
}

- (void)rightButtonWithImage:(NSString *)imageName andHighlighted:(NSString *)highlightedName andHandle:(RightBtnBlock)block
{
    [self.rightBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.rightBtn setImage:[UIImage imageNamed:highlightedName] forState:UIControlStateHighlighted];
    
    self.rightBtn.frame = CGRectMake(0, 0, 44, 44);
    
    if (IOS7_OR_LATER) {
        self.rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -22);
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    self.rightBtnBlock = block;
}

//右侧按钮点击事件
- (void)rightButtonAction:(UIButton *)button{
    
    if (self.rightBtnBlock) {
        self.rightBtnBlock(button);
    }
}

#pragma mark -getter
_GETTER_BEGIN(UIButton, rightBtn)
{
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_rightBtn setFrame:_CGR(0, 0, 30, 28)];
    [_rightBtn addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}
_GETTER_END(rightBtn)

- (void)dealloc
{
    NSLog(@"--dealloc: %@", NSStringFromClass([self class]));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
