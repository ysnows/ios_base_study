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


@interface MineViewController ()<UIGestureRecognizerDelegate,TencentSessionDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) TencentOAuth *tencentOAuth;
@property(nonatomic, strong) NSArray *permissions;
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIView *headerView;
@property(nonatomic, strong) UIImageView *headerImageView;

@end

@implementation MineViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title=@"我的";
        self.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
        
        _tencentOAuth=[[TencentOAuth alloc]initWithAppId:@"1106325594" andDelegate:self];
        _permissions=[NSArray arrayWithObjects:@"get_user_info",@"add_share", nil];


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

    // Do any additional setup after loading the view.
}


-(void)tapGesture{
    NSURL *url=[NSURL URLWithString:@"weixin://"];
    BOOL canOpenUrl=[[UIApplication sharedApplication] canOpenURL:url];
    if (canOpenUrl) {
        [[UIApplication sharedApplication] openURL:url options:nil completionHandler:^(BOOL success) {
            
        }];
    }
    
}

- (void)tencentDidLogin{
    NSLog(@"");
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    _headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, UI(200))];
    _headerView.backgroundColor=[UIColor whiteColor];
   
    [_headerView addSubview:({
        _headerImageView= [[UIImageView alloc]initWithFrame:CGRectMake(0, 30, _headerView.bounds.size.width, 120)];
        
        _headerImageView.backgroundColor=[UIColor whiteColor];
        _headerImageView.contentMode=UIViewContentModeScaleAspectFit;
        _headerImageView.clipsToBounds=YES;
        [_headerImageView setUserInteractionEnabled:YES];
        
        _headerImageView;
    })];


   return  _headerView;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    _headerImageView.image=[UIImage imageNamed:@"icon.bundle/icon.png"];
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
    cell.textLabel.text=@"name";
    cell.detailTextLabel.text=@"hello world";
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


@end
