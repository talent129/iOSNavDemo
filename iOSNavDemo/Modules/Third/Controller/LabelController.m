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
    
    /* 中划线 */
    UILabel *midLabel = [[UILabel alloc] init];
    midLabel.text = @"设置中划线";
    midLabel.textAlignment = NSTextAlignmentLeft;
    midLabel.font = Font(25);
    midLabel.textColor = [UIColor purpleColor];
    [self.view addSubview:midLabel];
    [midLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.trailing.equalTo(@-15);
        make.top.equalTo(setLabel.mas_bottom).mas_offset(10);
    }];
    NSDictionary *midDic = @{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *midAttributedStr = [[NSMutableAttributedString alloc] initWithString:midLabel.text attributes:midDic];
    midLabel.attributedText = midAttributedStr;
    
    /* 下划线 */
    UILabel *underLabel = [[UILabel alloc] init];
    underLabel.text = @"设置下划线";
    underLabel.textAlignment = NSTextAlignmentLeft;
    underLabel.font = Font(25);
    underLabel.textColor = [UIColor magentaColor];
    [self.view addSubview:underLabel];
    [underLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.trailing.equalTo(@-15);
        make.top.equalTo(midLabel.mas_bottom).mas_offset(10);
    }];
    
    NSDictionary *underAttributedDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSUnderlineColorAttributeName: [UIColor lightGrayColor]};
    NSMutableAttributedString *underAttributedStr = [[NSMutableAttributedString alloc]initWithString:underLabel.text attributes:underAttributedDic];
    underLabel.attributedText = underAttributedStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
