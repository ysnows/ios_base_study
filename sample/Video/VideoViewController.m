//
//  VideoViewController.m
//  sample
//
//  Created by ysnows on 2020/2/7.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation VideoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title=@"视频";
        self.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
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
    
    UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:self.view.bounds  collectionViewLayout:layout];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"id"];
    collectionView.dataSource=self;
    collectionView.delegate=self;

    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"id" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor redColor];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
        UIViewController *viewController= [[UIViewController alloc]init];
        viewController.navigationItem.title=@"内容";
        viewController.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"share" style:UIBarButtonItemStylePlain target:nil action:nil];
        [self.navigationController pushViewController:viewController animated:YES];
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.item%3==0) {
        return CGSizeMake(self.view.frame.size.width, 100);
    }
        return CGSizeMake((self.view.frame.size.width-10)/2, 300);
}
/*
#pragma mark - Navigation
 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
