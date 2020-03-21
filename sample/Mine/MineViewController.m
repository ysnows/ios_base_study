//
//  MineViewController.m
//  sample
//
//  Created by ysnows on 2020/2/10.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MineViewController.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import "YUIScreen.h"
#import "MasonryListTableViewController.h"
#import "QQLogin.h"
#import <SDWebImage.h>
#import "UIImageView+Circle.h"
#import "YCommentBar.h"


@interface MineViewController ()<UIGestureRecognizerDelegate ,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIView *headerView;
@property(nonatomic, strong) UIImageView *headerImageView;
@property(nonatomic, strong) NSString *nickname;
@property(nonatomic, strong) NSString *city;
@property(nonatomic, strong) NSString *avatarUrl;

@end

@implementation MineViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title=@"我的";
//        self.tabBarItem.title=@"我的";
//        self.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/page@2x.png"];
//        self.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];

//    [self.view addSubview:({
//        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100  )];
//        view.backgroundColor=[UIColor redColor];
//        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
//        tap.delegate=self;
//        [view addGestureRecognizer:tap];
//        view;
//    })];


    [self.view addSubview:({
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView;
    })];

    [[QQLogin sharedInstance]loginWithSuccessBlock:^(NSDictionary * _Nonnull userInfo, BOOL success) {

    }];
    // Do any additional setup after loading the view.

    [self toQQLogin];
}


-(void)tapGesture{

    [[YCommentBar sharedInstance] showCommentView];

//    NSURL *url=[NSURL URLWithString:@"weixin://"];
//    BOOL canOpenUrl=[[UIApplication sharedApplication] canOpenURL:url];
//    if (canOpenUrl) {
//        [[UIApplication sharedApplication] openURL:url options:nil completionHandler:^(BOOL success) {
//
//        }];
//    }
}

- (void)tencentDidLogin{
    NSLog(@"");
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    _headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, UI(200))];
    _headerView.backgroundColor=[UIColor whiteColor];

    [_headerView addSubview:({
        _headerImageView= [[UIImageView alloc]initWithFrame:CGRectMake((_headerView.bounds.size.width-120)/2, 30, 120, 120)];

        _headerImageView.backgroundColor=[UIColor whiteColor];
        _headerImageView.contentMode=UIViewContentModeScaleAspectFit;

        [_headerImageView setUserInteractionEnabled:YES];

//        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
//        [_headerImageView addGestureRecognizer:tap];

        _headerImageView;
    })];


   return  _headerView;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    if ([_avatarUrl length]>0) {
        [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:_avatarUrl] placeholderImage:[UIImage imageNamed:@"icon.bundle/icon.png"]];
        [_headerImageView asCircle];
    }else{
        _headerImageView.image=[UIImage imageNamed:@"icon.bundle/icon.png"];
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return UI(200);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    if (indexPath.row==0) {
        if ([_nickname length]>0) {
            cell.textLabel.text=_nickname;
        }else{
            cell.textLabel.text=@"昵称";
        }
    }

    if (indexPath.row==1) {
        if ([_city length]>0) {
            cell.textLabel.text=_city;
        }else{
            cell.textLabel.text=@"地区";
        }
    }

    if (indexPath.row==2) {
        cell.textLabel.text=@"Masonry Examples";
    }

    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(void)toQQLogin{

    [[QQLogin sharedInstance]loginWithSuccessBlock:^(NSDictionary * _Nonnull userInfo, BOOL success) {
        if (success) {
            self.avatarUrl=[userInfo objectForKey:@"figureurl_qq_2"];
            self.nickname = [userInfo objectForKey:@"nickname"];
            self.city =[userInfo objectForKey:@"city"];
            [self.tableView reloadData];
        }
    }];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==2) {
        [self.navigationController pushViewController:[MasonryListTableViewController new] animated:YES];
    }
}

@end
