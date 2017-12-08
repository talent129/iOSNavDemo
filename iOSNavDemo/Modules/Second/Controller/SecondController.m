//
//  SecondController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "SecondController.h"

#define Height_Header 64

@interface SecondController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) BOOL isCanUseSideBack;  // 手势是否启动

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *navBarBackground;

@end

@implementation SecondController

#pragma mark -lazy load
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 100;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(StatusBarHeight, 0, 0, 0);
    }
    return _tableView;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self cancelSideBack];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self startSideBack];
}

/**
 * 关闭右滑返回
 */
- (void)cancelSideBack
{
    self.isCanUseSideBack = NO;
    
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    }
}
/*
 开启右滑返回
 */
- (void)startSideBack
{
    self.isCanUseSideBack = YES;
    
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer
{
    return self.isCanUseSideBack;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
    
    for (id obj in self.navigationController.navigationBar.subviews) {
        NSLog(@"---%@", obj);
    }
    NSLog(@"first: %@ --class: %@", self.navigationController.navigationBar.subviews.firstObject, NSStringFromClass([self.navigationController.navigationBar.subviews.firstObject class]));
    
    self.navBarBackground = self.navigationController.navigationBar.subviews.firstObject;
    
    self.navBarBackground.alpha = 0;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
}

#pragma mark -createUI
- (void)createUI
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(@0);
        make.top.equalTo(self.mas_topLayoutGuideBottom).mas_offset(-64);
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
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld--%02zd", indexPath.section, indexPath.row];
    
    return cell;
}

#pragma mark -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"---click cell: %@", indexPath);
    
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
    ///不允许下拉
    if (scrollView.contentOffset.y < 0) {
        //向下滑动时 内容偏移量设置为(0, 0)
        [self.tableView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    
    NSLog(@"contentOffset.y: %f", scrollView.contentOffset.y);
    
    if (scrollView.contentOffset.y > Height_Header) {
        
        //设置导航栏title属性
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
        self.navigationItem.title = @"Second";
        
        self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
        
    } else {
        
        self.navigationItem.title = @"";
        self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    }
    
    CGFloat currentAlpha = (scrollView.contentOffset.y - (0))/(Height_Header - (0));
    currentAlpha = currentAlpha < 0.0 ? 0.0 : (currentAlpha >= 1.0 ? 1.0 : currentAlpha);
    
    NSLog(@"---%f", currentAlpha);
    self.navBarBackground.alpha = currentAlpha;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
