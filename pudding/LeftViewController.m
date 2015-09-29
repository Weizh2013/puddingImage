//
//  LeftViewController.m
//  pudding
//
//  Created by customer on 15/9/27.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "LeftViewController.h"
#import "WEILeftFooterView.h"
#import "WEILeftHeaderView.h"
#import "LeftTableViewCell.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *_backGroundView;
    UITableView *_tableView;
    NSArray *_leftMenuImages;
    NSArray *_leftMenuTitles;
    WEILeftHeaderView *_headerView;
    WEILeftFooterView *_footerView;
}
@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableViewInit];

}

- (void)tableViewInit{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 280, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"side_menu_bg.jpg"]];
    _tableView.backgroundView.frame = _tableView.frame;
    _tableView.scrollEnabled = NO;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerClass:[LeftTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    _leftMenuImages = @[@"side_menu_icon_history",@"side_menu_icon_cache",@"side_menu_icon_statistics",@"side_menu_icon_promotor"];
    _leftMenuTitles = @[@"追番记录",@"离线缓存",@"布丁统计",@"布丁娘送周边"];
}

#pragma tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LeftTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor clearColor];
    cell.menuImageView.image = [[UIImage imageNamed:_leftMenuImages[indexPath.row]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    cell.menuLabel.text = _leftMenuTitles[indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    _headerView = [[WEILeftHeaderView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 200)];;
    _headerView.avatarImage = [[UIImage imageNamed:@"default_avatar"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _headerView.nickNameLabel.text = @"请登陆并获取蕃文";
    [_headerView addAvatarTarget:self action:@selector(avatarClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addFansTarget:self action:@selector(fansClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addFollowerTarget:self action:@selector(followerClicked:) forControlEvents:UIControlEventTouchUpInside];
    _headerView.followers = 0;
    _headerView.fans = 0;
    _headerView.isLogin = YES;
    return _headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    _footerView = [[WEILeftFooterView alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 230)];
    _footerView.msgImageView.image = [[UIImage imageNamed:@"side_menu_icon_notification"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _footerView.setImageView.image = [[UIImage imageNamed:@"side_menu_icon_setting"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_footerView.setButton setTitle:@"设置" forState:UIControlStateNormal];
    [_footerView.msgButton setTitle:@"通知" forState:UIControlStateNormal];
    [_footerView.setButton addTarget:self action:@selector(settingClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_footerView.msgButton addTarget:self action:@selector(notificationClicked:) forControlEvents:UIControlEventTouchUpInside];
    return _footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 200.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 300.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark button clicked evens
- (void)avatarClicked:(id)sender{
    NSLog(@"%s",__func__);
}

- (void)fansClicked:(id)sender{
    NSLog(@"%s",__func__);
}

- (void)followerClicked:(id)sender{
    NSLog(@"%s",__func__);
}

- (void)notificationClicked:(id)sender{
    NSLog(@"%s",__func__);
}

- (void)settingClicked:(id)sender{
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
