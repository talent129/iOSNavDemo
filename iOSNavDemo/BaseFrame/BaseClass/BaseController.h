//
//  BaseController.h
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicDefine.h"
#import "Const.h"
#import "InterfaceDefine.h"
#import "GlobalConfiguration.h"
#import "Masonry.h"
#import "UIImage+ColorCreateImage.h"

typedef void(^RightBtnBlock)(UIButton *button);

@interface BaseController : UIViewController

@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, copy) RightBtnBlock rightBtnBlock;

//添加右侧按钮
- (void)rightButtonWithTitle:(NSString *)title andHandle:(RightBtnBlock)block;

- (void)rightButtonWithImage:(NSString *)imageName andHighlighted:(NSString *)highlightedName andHandle:(RightBtnBlock)block;

@end
