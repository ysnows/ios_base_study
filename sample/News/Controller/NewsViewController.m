//
//  ViewController.m
//  sample
//
//  Created by ysnows on 2020/2/7.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTableViewCell.h"
#import "NewsDetailViewController.h"
#import "DeleteDialog.h"
#import "IndexListLoader.h"
#import "NewsItem.h"
#import "MJRefresh.h"
#import "YUIScreen.h"
#import "YMediator.h"


@interface NewsViewController ()<UITableViewDataSource,UITabBarDelegate,NewsTableViewCellDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray<NewsItem *> *dataArr;
@property(nonatomic, strong) IndexListLoader *loader;


@end

@implementation NewsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title=@"新闻";
        self.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/home@2x.png"];
        self.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/home_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    


    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;

    
    self->_loader=[[IndexListLoader alloc]init];
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self->_loader loadListDataWitBlock:^(BOOL success, NSArray<NewsItem *> *  data) {
            if (success) {
                self.dataArr=data;
                [self.tableView reloadData];
            }
            [self.tableView.mj_header endRefreshing];
            
        }];
    }];

    [self.view addSubview:_tableView];

    [self.tableView.mj_header beginRefreshing];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    NewsItem *item=    [self.dataArr objectAtIndex:indexPath.row];
    cell.delegate=self;
    [cell setData:item];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UI(120);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
        NewsItem *item=[self.dataArr objectAtIndex:indexPath.row];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:item.uniquekey];
    
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
        [YMediator openUrl:@"detail" withParams:@{@"url":item.url,@"controller":self.navigationController}];

//        NewsDetailViewController *viewController= [[NewsDetailViewController alloc]initWithUrl:item.url];
       
//        UIViewController *viewController=[YMediator detailViewControllerWithUrl:item.url];

//        viewController.navigationItem.title=item.title;
//        viewController.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"share" style:UIBarButtonItemStylePlain target:nil action:nil];
//        [self.navigationController pushViewController:viewController animated:YES];
    

}

- (void)tableViewCell:(UITableViewCell *)cell clickDeleteButton:(UIButton *)deleteButton{
    DeleteDialog *deleteDialog=[[DeleteDialog alloc]initWithFrame:self.view.bounds];
    CGRect startRect=[cell convertRect: deleteButton.frame toView:nil];
    
    [deleteDialog show:CGPointMake(startRect.origin.x, startRect.origin.y) withDeleted:^{
        
//        [self->_dataArr removeLastObject];
        [self->_tableView deleteRowsAtIndexPaths:@[[self->_tableView indexPathForCell:cell]]  withRowAnimation:UITableViewRowAnimationAutomatic];
        NSLog(@"deleted");
    }];
}

@end
