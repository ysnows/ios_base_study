//
//  YRVTabBarControllerViewController.m
//  sample
//
//  Created by ysnows on 2020/3/21.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "NewsViewController.h"
#import "VideoViewController.h"
#import "RecommendViewController.h"
#import "MineViewController.h"
#import "YTabBarViewController.h"
#import "RDVTabBarItem.h"

@interface YTabBarViewController ()

@end

@implementation YTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.tabBar.translucent = YES;
    // Customize the tabBar background
    self.tabBar.backgroundView.backgroundColor = [UIColor colorWithRed:245/255.0
                                                            green:245/255.0
                                                             blue:245/255.0
                                                            alpha:0.9];

    NewsViewController *firstVC=[[NewsViewController alloc]init];
    VideoViewController *secondVC=[[VideoViewController alloc]init];
    RecommendViewController *thirdVC=[[RecommendViewController alloc]init];
    MineViewController *fourthVC=[[MineViewController alloc]init];


    [self setViewControllers:@[
            [[UINavigationController alloc] initWithRootViewController:firstVC],
            [[UINavigationController alloc] initWithRootViewController:secondVC],
            [[UINavigationController alloc] initWithRootViewController:thirdVC],
            [[UINavigationController alloc] initWithRootViewController:fourthVC]
    ]];

    [self _setImageText];
}


-(void)_setImageText{

    NSArray *tabbarImgs=@[@"tabbar_home",@"tabbar_activity",@"tabbar_notes",@"tabbar_myCenter"];
    NSArray *titles=@[@"首页", @"活动", @"游记", @"我的"];

    NSInteger index=0;
    for (RDVTabBarItem *item in [self.tabBar items]) {

        UIImage *selectedImg=[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected.png",[tabbarImgs  objectAtIndex:index]]];

        UIImage *unselectedImg=[UIImage imageNamed:[NSString stringWithFormat:@"%@_normal.png",[tabbarImgs  objectAtIndex:index]]];

        [item setFinishedSelectedImage:selectedImg withFinishedUnselectedImage:unselectedImg];

        NSDictionary *selectedAttr=@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName: [UIColor blackColor]};
        [item setSelectedTitleAttributes:selectedAttr];

        NSDictionary *unselectedAttr=@{NSFontAttributeName:[UIFont systemFontOfSize:11],NSForegroundColorAttributeName: [UIColor lightGrayColor]};
        [item setUnselectedTitleAttributes:unselectedAttr];


        item.title = titles[index];
        index++;
    }

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
