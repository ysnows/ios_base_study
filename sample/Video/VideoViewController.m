//
//  VideoViewController.m
//  sample
//
//  Created by ysnows on 2020/2/7.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoListCell.h"
#import "VideoListLoader.h"
#import "MJRefresh.h"
#import "Video.h"
#import <RDVTabBarController.h>



@interface VideoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic, strong) NSArray<Video *> *videoList;
@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation VideoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.title=@"视频";
//        self.tabBarItem.title=@"视频";
//        self.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/video@2x.png"];
//        self.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing=10;
    layout.minimumInteritemSpacing=10;
    layout.itemSize=CGSizeMake((self.view.frame.size.width-10)/2, 300);
    
    _collectionView=[[UICollectionView alloc]initWithFrame:self.view.bounds  collectionViewLayout:layout];

    [_collectionView registerClass:[VideoListCell class] forCellWithReuseIdentifier:@"id"];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;

    _collectionView.backgroundColor=[UIColor whiteColor];

    [self.view addSubview:_collectionView];
    
    VideoListLoader *loader =[[VideoListLoader alloc]init];
    _collectionView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [loader loadVideoListWithCompleted:^(NSArray<Video *> * _Nonnull videoArr) {
            [self->_collectionView.mj_header endRefreshing];
            self.videoList=videoArr;
            [self->_collectionView reloadData];
        }];
    }];
    
    if (self.rdv_tabBarController.tabBar.translucent) {
        UIEdgeInsets insets = UIEdgeInsetsMake(0,
                                               0,
                                               CGRectGetHeight(self.rdv_tabBarController.tabBar.frame),
                                               0);
        
        self.collectionView.contentInset = insets;
        self.collectionView.scrollIndicatorInsets = insets;
    }


    [_collectionView.mj_header beginRefreshing];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_videoList count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VideoListCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"id" forIndexPath:indexPath];
    Video *item=[_videoList objectAtIndex:indexPath.row];
    [cell setVideo:item];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
//        UIViewController *viewController= [[UIViewController alloc]init];
//        viewController.navigationItem.title=@"内容";
//        viewController.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"share" style:UIBarButtonItemStylePlain target:nil action:nil];
//        [self.navigationController pushViewController:viewController animated:YES];
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
       return CGSizeMake(self.view.frame.size.width, self.view.frame.size.width/16*9+60);
}

@end
