//
//  FSecondController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/4.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "FSecondController.h"

static CGFloat Height_Header = 200.0;

@interface FSecondController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

/**
 标记当前页面滑动偏移量
 */
@property (nonatomic, assign) CGFloat contentOffSet_Y;

@end

@implementation FSecondController

#pragma mark -lazy load
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = kVCViewColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 100;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(kNavBarHeight, 0, 0, 0);
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Width, Height_Header)];
        headView.backgroundColor = [UIColor colorWithPatternImage:IMAGE(@"header")];
        _tableView.tableHeaderView = headView;
        
    }
    return _tableView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self changeNavBarAlpha:self.contentOffSet_Y];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"FSecond";
    
    [self setupUI];
    
    self.contentOffSet_Y = 0;
    
}

#pragma mark -setupUI
- (void)setupUI
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(@0);
        make.top.equalTo(self.mas_topLayoutGuideBottom).mas_offset(-kNavBarHeight);
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
    NSLog(@"contentOffset.y: %f", scrollView.contentOffset.y);
    self.contentOffSet_Y = scrollView.contentOffset.y;
    [self changeNavBarAlpha:self.contentOffSet_Y];
}

#pragma mark -滑动导航渐变
- (void)changeNavBarAlpha:(CGFloat)yOffset
{
    CGFloat currentAlpha = (yOffset - (-0))/(Height_Header - (-0));
    currentAlpha = currentAlpha <= 0.0 ? 0.0 : (currentAlpha >= 1.0 ? 1.0 : currentAlpha);
    NSLog(@"---%f", 1 - currentAlpha);
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:kNavBarColorString alpha:1 - currentAlpha]] forBarMetrics:UIBarMetricsDefault];
    
    if (yOffset > Height_Header) {
        self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
        
        [self.backButton setImage:IMAGE(@"navLeft_gray") forState:UIControlStateNormal];
        [self.backButton setImage:IMAGE(@"navLeft_gray") forState:UIControlStateHighlighted];
        
        //设置导航栏title属性
        self.title = @"";
    } else {
        self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
        
        [self.backButton setImage:IMAGE(@"navLeft") forState:UIControlStateNormal];
        [self.backButton setImage:IMAGE(@"navLeft") forState:UIControlStateHighlighted];
        
        //设置导航栏title属性
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor whiteColor]}];
        self.title = @"FSecond";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
