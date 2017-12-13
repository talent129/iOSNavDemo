//
//  MultiProtocolController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/12.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "MultiProtocolController.h"

@interface MultiProtocolController ()

@end

@implementation MultiProtocolController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"多协议-未ok";
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"《这是协议一》《这是协议二》《这是协议三》《友好互助条约一》《友好互助条约二》";
    label.textColor = [UIColor blackColor];
    label.font = Font(15);
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.trailing.equalTo(@-15);
        make.top.equalTo(@100);
    }];
    
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [label addGestureRecognizer:tap];
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap
{
    NSLog(@"--tap.view: %@", tap.view);
    CGPoint point = [tap locationInView:tap.view];
    NSLog(@"--%f---%f", point.x, point.y);
    
    [tap.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UIView *pointView = [[UIView alloc] init];
    pointView.backgroundColor = [UIColor redColor];
    [tap.view addSubview:pointView];
    [pointView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@(point.x));
        make.top.equalTo(@(point.y));
        make.size.mas_equalTo(CGSizeMake(5, 5));
    }];
    
    CGPoint pp = [tap.view convertPoint:point toView:self.view];
    CGPoint ppp = [self.view convertPoint:point fromView:tap.view];
    NSLog(@"--%f---%f", pp.x, pp.y);
    NSLog(@"--%f---%f", ppp.x, ppp.y);
    
    NSString *protocol = @"《这是协议二》";
    UILabel *protocolLabel = (UILabel *)tap.view;
    NSRange protocolRange = [protocolLabel.text rangeOfString:protocol];
    /* location: 从0开始 check的第一个字段 即:《   -> 7
     length: 长度   -> 7
     */
    NSLog(@"--%ld--%ld", protocolRange.location, protocolRange.length);
    
    NSString *str = @"这";
    CGFloat width = [str sizeWithAttributes:@{NSFontAttributeName: Font(15)}].width;
    CGFloat height = [str sizeWithAttributes:@{NSFontAttributeName: Font(15)}].height;
    NSLog(@"--单个字宽度: %f --高度: %f", width, height);
    
    //计算总行数
    CGSize labelSize = [self labelRectWithSize:CGSizeMake(SCREEN_Width - 30, MAXFLOAT) LabelText:protocolLabel.text Font:Font(15)];
    NSInteger lineNum = labelSize.height / height;
    NSLog(@"--行数: %ld", lineNum);
    
    //何时换行 多个字时换行
    if ((SCREEN_Width - 30)/width) {
        
    }
    
    //判断哪行
    if (point.y <= height) {
        //第一行
        NSLog(@"--第一行");
        /// start: 15 + width * 7  end: start + 7 * width
        if (pp.x > 15 && pp.x <= (15 + 7 * width)) {
            //协议一
            [self protocolAlert:@"协议一"];
        } else if (pp.x > (15 + 7 * width) && pp.x <= 15 + 14 * width) {
            //协议二
            [self protocolAlert:@"协议二"];
        }
    } else if (point.y > height && point.y <= height * 2) {
        //第二行
        NSLog(@"--第二行");
        /// start: 15 + width * 7  end: start + 7 * width
        if (pp.x > 15 && pp.x <= (15 + 7 * width)) {
            //协议一
            [self protocolAlert:@"协议一"];
        } else if (pp.x > (15 + 7 * width) && pp.x <= 15 + 14 * width) {
            //协议二
            [self protocolAlert:@"协议二"];
        }
    } else if (point.y > height * 2 && point.y <= height * 3) {
        //第三行
        NSLog(@"--第三行");
        /// start: 15 + width * 7  end: start + 7 * width
        if (pp.x > 15 && pp.x <= (15 + 7 * width)) {
            //协议一
            [self protocolAlert:@"协议一"];
        } else if (pp.x > (15 + 7 * width) && pp.x <= 15 + 14 * width) {
            //协议二
            [self protocolAlert:@"协议二"];
        }
    }
    
//    NSString *check = @"《友好互助条约一》";
//    UILabel *label = (UILabel *)tap.view;
//    NSRange checkRange = [label.text rangeOfString:check];
//    /* location: 从0开始 check的第一个字段 即:《   -> 21
//     length: 长度   -> 9
//     */
//    NSLog(@"--%ld--%ld", checkRange.location, checkRange.length);
    
    
    UITextView *textView = [[UITextView alloc] init];
    
    
}

- (void)protocolAlert:(NSString *)protocol
{
    NSLog(@"--%@", protocol);
    
}

- (CGSize)labelRectWithSize:(CGSize)size
                  LabelText:(NSString *)labelText
                       Font:(UIFont *)font{
    
    NSDictionary  *dic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    CGSize rect = [labelText boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return rect;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
