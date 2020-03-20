//
//  RecommendViewController.m
//  sample
//
//  Created by ysnows on 2020/2/8.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "RecommendViewController.h"
#import "VideoListLoader.h"
#import <IGListKit/IGListKit.h>
#import "YUIScreen.h"
#import "RecommendSectionController.h"
#import <MJRefresh/MJRefresh.h>

@interface RecommendViewController ()<IGListAdapterDataSource>

@property(nonatomic, strong) NSArray *dataArr;
@property(nonatomic, strong) IGListAdapter *adapter;
@property(nonatomic, strong) UICollectionView *collectionView;


@end


@implementation RecommendViewController

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.tabBarItem.title=@"推荐";
        self.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/like@2x.png"];
        self.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/like_selected@2x.png"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    VideoListLoader *listLoader = [[VideoListLoader alloc]init];
    #pragma mark - collectionview add
    [self.view addSubview:({
        _collectionView=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor=[UIColor whiteColor];
        _collectionView.mj_header=[MJRefreshHeader headerWithRefreshingBlock:^{
            #pragma mark - listloader init&load
            [listLoader loadVideoListWithCompleted:^(NSArray<Video *> * _Nonnull videoArr) {
                self->_dataArr=videoArr;
                [self->_adapter reloadDataWithCompletion:nil];
                [self->_collectionView.mj_header endRefreshing];
            }];
            
        }];
        _collectionView;
    })];


   #pragma mark - adapter init
    _adapter = [[IGListAdapter alloc]initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:0];
    _adapter.dataSource=self;
    _adapter.collectionView=_collectionView;
    
    
    [_collectionView.mj_header  beginRefreshing];

    // Do any additional setup after loading the view.
//    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
//    scrollView.backgroundColor=[UIColor lightGrayColor];
//
//    NSArray *colorArr=@[[UIColor redColor],[UIColor greenColor],[UIColor blueColor],[UIColor blackColor],[UIColor grayColor]];
//
//    for (int i=0; i<5; i++) {
//        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, self.view.frame.size.height)];
//        view.backgroundColor=[colorArr objectAtIndex:i];
//        [scrollView addSubview:view];
//    }
//    scrollView.pagingEnabled=YES;
//
//    scrollView.delegate=self;
//
//    scrollView.contentSize=CGSizeMake(self.view.frame.size.width*5, self.view.frame.size.height);
//
//    [self.view addSubview:scrollView];
    
}


//- (void)scrollViewDidScroll:(UIScrollView *)scroll{
//    NSLog(@"offset is %f",scroll.contentOffset.x);
//}
//


- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return _dataArr;

}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    return [RecommendSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{

    return nil;
}
@end
