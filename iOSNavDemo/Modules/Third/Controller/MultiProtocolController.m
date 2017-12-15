//
//  MultiProtocolController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/12.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "MultiProtocolController.h"
#import "ProtocolTextView.h"
#import "ProtocolTestController.h"

@interface MultiProtocolController ()

@end

@implementation MultiProtocolController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"多协议";
    
    NSString *content = @"《这是协议一》《这是协议二》《这是协议三》《友好互助条约一》《友好互助条约二》";
    
    CGSize size = [self labelRectWithSize:CGSizeMake(SCREEN_Width - 30, MAXFLOAT) LabelText:content Font:Font(16)];
    NSLog(@"--%f--%f", size.width, size.height);
    
    ProtocolTextView *textView = [[ProtocolTextView alloc] initWithFrame:CGRectMake(15, 100, SCREEN_Width - 30, size.height + 7)];
    textView.backgroundColor = self.view.backgroundColor;
    textView.text = content;
    textView.font = Font(16);
    textView.textColor = [UIColor cyanColor];
    [self.view addSubview:textView];
    
    NSString *protocol1 = @"《这是协议二》";
    NSString *protocol2 = @"《友好互助条约一》";
    [textView partText:protocol1 partTextColor:[UIColor blueColor] clickedPartTextBlock:^(NSString *clickedText) {
        NSLog(@"---%@", clickedText);
        [self pushToProtocolTestController:clickedText];
    }];
    
    [textView partText:protocol2 partTextColor:[UIColor magentaColor] clickedPartTextBlock:^(NSString *clickedText) {
        NSLog(@"---%@", clickedText);
        [self pushToProtocolTestController:clickedText];
    }];
    
}

- (void)pushToProtocolTestController:(NSString *)title
{
    ProtocolTestController *vc = [[ProtocolTestController alloc] init];
    vc.title = title;
    [self.navigationController pushViewController:vc animated:YES];
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
