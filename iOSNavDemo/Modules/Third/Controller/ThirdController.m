//
//  ThirdController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "ThirdController.h"
#import "ProtocolTestController.h"
#import "MultiProtocolController.h"
#import "SuccessController.h"
#import "LabelController.h"
#import "ThirdTestController.h"

@interface ThirdController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
//@property (nonatomic, assign) BOOL isCanUseSideBack;  // 手势是否启动

@end

@implementation ThirdController

#pragma mark -lazy load
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 100;
        _tableView.rowHeight = UITableViewAutomaticDimension;
    }
    return _tableView;
}

//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    [self cancelSideBack];
//}
//
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    [self startSideBack];
//}
//
///**
// * 关闭右滑返回
// */
//-(void)cancelSideBack{
//    self.isCanUseSideBack = NO;
//    
//    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
//    }
//}
///*
// 开启右滑返回
// */
//- (void)startSideBack {
//    self.isCanUseSideBack = YES;
//    
//    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
//    }
//}
//
//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer {
//    return self.isCanUseSideBack;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Third";
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    
    self.titleArray = @[@"协议", @"多协议", @"动画", @"label设置文字不同颜色、大小, 下划线", @"test"];
    
    [self setupUI];
    
    [self addRightBarBtnWithImage];
}

//右侧按钮 -测试
- (void)addRightBarBtnWithImage
{
    [self rightButtonWithImage:@"home__share_close" andHighlighted:@"home__share_close" andHandle:^(UIButton *button) {
        NSLog(@"--点击了右侧按钮-图片");
    }];
}

#pragma mark -setupUI
- (void)setupUI
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(@0);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
    }];
    
}

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *iden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    
    if (indexPath.row < 5) {
        cell.textLabel.text = self.titleArray[indexPath.row];
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"section: %ld-row: %02zd", indexPath.section, indexPath.row];
    }
    
    return cell;
}

#pragma mark -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"---click cell: %@", indexPath);
    
    switch (indexPath.row) {
        case 0:
        {
            ProtocolTestController *vc = [[ProtocolTestController alloc] init];
            vc.title = @"协议";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            MultiProtocolController *vc = [[MultiProtocolController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            SuccessController *vc = [[SuccessController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            LabelController *vc = [[LabelController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            ThirdTestController *vc = [[ThirdTestController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"--scrollView -contentOffset.y: %f", scrollView.contentOffset.y);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
