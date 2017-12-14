//
//  LabelController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/14.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "LabelController.h"

@interface LabelController ()

@end

@implementation LabelController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"label设置颜色、大小";
    
    NSString *string = @"2017南京大屠杀死难者国家公祭仪式";
    
    UILabel *setLabel = [[UILabel alloc] init];
    setLabel.text = string;
    setLabel.textColor = [UIColor blackColor];
    setLabel.font = Font(20);
    setLabel.numberOfLines = 0;
    [self.view addSubview:setLabel];
    [setLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.trailing.equalTo(@-15);
        make.top.equalTo(@100);
    }];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSUInteger firstLoc = [[attributedString string] rangeOfString:@"南"].location;
    NSUInteger secondLoc = [[attributedString string] rangeOfString:@"者"].location + 1;
    NSRange range = NSMakeRange(firstLoc, secondLoc - firstLoc);
    // 改变颜色
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    // 改变字体大小及类型
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica-BoldOblique" size:27] range:range];
    // 为label添加Attributed
    [setLabel setAttributedText:attributedString];
    
    ///直接文字range
    NSRange anotherRange = [setLabel.text rangeOfString:@"国家"];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor purpleColor] range:anotherRange];
    [attributedString addAttribute:NSFontAttributeName value:Font(27) range:anotherRange];
    [setLabel setAttributedText:attributedString];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
