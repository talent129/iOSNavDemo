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

@property (nonatomic, assign) NSInteger currentBtnIndex;

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *btnArray;

@property (nonatomic, strong) UIView *btnView;
@property (nonatomic, strong) UIView *signLineView;

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
        _control.backgroundColor = [UIColor colorWithDecimalRed:0 green:0 blue:0 alpha:0.3];
    }
    return _control;
}

- (UIView *)signLineView
{
    if (!_signLineView) {
        _signLineView = [[UIView alloc] init];
        _signLineView.backgroundColor = [UIColor purpleColor];
    }
    return _signLineView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArray = [NSMutableArray array];
    
    NSArray *btnArr = @[@"btnArr00", @"btnArr01", @"btnArr02"];
    self.btnArray = [NSMutableArray arrayWithArray:btnArr];
    
    self.currentBtnIndex = 0;
    
    [self addButtons];
    
    [self addTableViews];
}

- (void)addButtons
{
    UIView *btnView = [[UIView alloc] init];
    btnView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btnView];
    self.btnView = btnView;
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
    
    [self.btnView addSubview:self.signLineView];
    [self.signLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_Width/4.0, 2));
        make.bottom.equalTo(@0);
    }];
    
}

- (void)btnClick:(UIButton *)btn
{
    NSLog(@"--tag: %ld", (long)btn.tag);
    self.currentBtnIndex = btn.tag;
    
    switch (self.currentBtnIndex) {
        case 0:
        {
            NSArray *btnArr = @[@"btnArr00", @"btnArr01", @"btnArr02"];
            self.btnArray = [NSMutableArray arrayWithArray:btnArr];
        }
            break;
        case 1:
        {
            NSArray *btnArr = @[@"btnArr10", @"btnArr11", @"btnArr12", @"btnArr13"];
            self.btnArray = [NSMutableArray arrayWithArray:btnArr];
        }
            break;
        case 2:
        {
            NSArray *btnArr = @[@"btnArr20", @"btnArr21", @"btnArr22", @"btnArr23", @"btnArr24"];
            self.btnArray = [NSMutableArray arrayWithArray:btnArr];
        }
            break;
        case 3:
        {
            NSArray *btnArr = @[@"btnArr30", @"btnArr31", @"btnArr32", @"btnArr33", @"btnArr34", @"btnArr35"];
            self.btnArray = [NSMutableArray arrayWithArray:btnArr];
        }
            break;
            
        default:
            break;
    }
    
    [self.view addSubview:self.control];
    [self.control mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(@0);
        make.top.equalTo(self.mas_topLayoutGuideBottom).mas_offset(49);
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
    }];
    [self.control addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.control addSubview:self.btnTableView];
    [self.btnTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_Width, 44 * self.btnArray.count));
        make.centerX.equalTo(self.control);
    }];
    
    [self.btnTableView reloadData];
}

- (void)tapAction
{
    NSLog(@"--tap");
    if (_control) {
        [_control removeFromSuperview];
        _control = nil;
    }
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
        return self.dataArray.count;
    }
    return self.btnArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:self.tableView]) {
        static NSString *iden = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
            
        }
        
        cell.textLabel.text = self.dataArray[indexPath.row];
        
        return cell;
    }
    
    static NSString *iden = @"btnCell";
    UITableViewCell *btnCell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!btnCell) {
        btnCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        
    }
    
    btnCell.textLabel.text = self.btnArray[indexPath.row];
    btnCell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return btnCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"--didSelect: %@", indexPath);
    
    [self tapAction];
    
    if ([tableView isEqual:self.btnTableView]) {
        
        [self.signLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(SCREEN_Width/4.0 * self.currentBtnIndex);
            make.bottom.equalTo(@0);
            make.size.mas_equalTo(CGSizeMake(SCREEN_Width/4.0, 2));
        }];
        
        switch (indexPath.row) {
            case 0:
            {
                self.dataArray = [NSMutableArray array];
            }
                break;
            case 1:
            {
                NSArray *dataArr = @[@"dataArr0"];
                self.dataArray = [NSMutableArray arrayWithArray:dataArr];
            }
                break;
            case 2:
            {
                NSArray *dataArr = @[@"dataArr0", @"dataArr1"];
                self.dataArray = [NSMutableArray arrayWithArray:dataArr];
            }
                break;
            case 3:
            {
                NSArray *dataArr = @[@"dataArr0", @"dataArr1", @"dataArr2"];
                self.dataArray = [NSMutableArray arrayWithArray:dataArr];
            }
                break;
                
            default:
            {
                NSArray *dataArr = @[@"dataArr0", @"dataArr1", @"dataArr2", @"dataArr3", @"dataArr4", @"dataArr5"];
                self.dataArray = [NSMutableArray arrayWithArray:dataArr];
            }
                break;
        }
        
        [self.tableView reloadData];
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
