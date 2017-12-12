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
    
    self.title = @"多协议";
    
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
    
    NSString *check = @"《友好互助条约一》";
    NSRange checkRange = [label.text rangeOfString:check];
    /* location: 从0开始 check的第一个字段 即:《   -> 21
       length: 长度   -> 9
     */
    NSLog(@"--%ld--%ld", checkRange.location, checkRange.length);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
