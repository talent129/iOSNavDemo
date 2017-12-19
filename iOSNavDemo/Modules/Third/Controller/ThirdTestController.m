//
//  ThirdTestController.m
//  iOSNavDemo
//
//  Created by zijinsuo_hgc on 2017/12/19.
//  Copyright © 2017年 Curtis. All rights reserved.
//

#import "ThirdTestController.h"

@interface ThirdTestController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *btnTableView;

@property (nonatomic, strong) UIControl *control;

@property (nonatomic, assign) NSInteger tapInter;
@property (nonatomic, assign) NSInteger btnInter;

@end

@implementation ThirdTestController

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

- (UITableView *)btnTableView
{
    if (!_btnTableView) {
        _btnTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _btnTableView.delegate = self;
        _btnTableView.dataSource = self;
        _btnTableView.rowHeight = 44;
    }
    return _btnTableView;
}

- (UIControl *)control
{
    if (!_control) {
        _control = [[UIControl alloc] init];
        _control.backgroundColor = [UIColor colorWithDecimalRed:0 green:0 blue:0 alpha:0.6];
    }
    return _control;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tapInter = 0;
    self.btnInter = 0;
    
    [self addButtons];
    
    [self addTableViews];
}

- (void)addButtons
{
    UIView *btnView = [[UIView alloc] init];
    btnView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btnView];
    [btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(@0);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.height.equalTo(@49);
    }];
    
    for (int i = 0; i < 4; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        [btn setTitle:[NSString stringWithFormat:@"btn%d", i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btnView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(SCREEN_Width/4.0 * i);
            make.size.mas_equalTo(CGSizeMake(SCREEN_Width/4.0, 49));
            make.top.equalTo(@0);
        }];
    }
}

- (void)btnClick:(UIButton *)btn
{
    NSLog(@"--tag: %ld", (long)btn.tag);
    [self.view addSubview:self.control];
    [self.control mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(@0);
        make.top.equalTo(self.mas_topLayoutGuideBottom).mas_offset(49);
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
    }];
    [self.control addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.control addSubview:self.btnTableView];
    [self.btnTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_Width, 44 * 5));
        make.centerX.equalTo(self.control);
    }];
    
}

- (void)tapAction
{
    NSLog(@"--tap");
    [self.control removeFromSuperview];
    self.control = nil;
}

- (void)addTableViews
{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(@0);
        make.top.equalTo(self.mas_topLayoutGuideBottom).mas_offset(49);
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
    }];
    
}

#pragma mark -UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([tableView isEqual:self.tableView]) {
        return self.tapInter;
    }
    return self.btnInter;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.tableView]) {
        static NSString *iden = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
            
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"tableView: %ld", indexPath.row];
        
        return cell;
    }
    
    static NSString *iden = @"btnCell";
    UITableViewCell *btnCell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!btnCell) {
        btnCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        
    }
    
    btnCell.textLabel.text = [NSString stringWithFormat:@"btnTableView: %ld", indexPath.row];
    btnCell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return btnCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"--didSelect: %@", indexPath);
    
    if (_control) {
        [_control removeFromSuperview];
        _control = nil;
    }
    
    if ([tableView isEqual:self.btnTableView]) {
        
        self.btnInter = indexPath.row;
        
        [self.btnTableView reloadData];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
