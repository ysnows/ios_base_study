//
//  RecommendViewController.m
//  sample
//
//  Created by ysnows on 2020/2/8.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController ()<UIScrollViewDelegate>

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
    // Do any additional setup after loading the view.

    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.backgroundColor=[UIColor lightGrayColor];
    
    NSArray *colorArr=@[[UIColor redColor],[UIColor greenColor],[UIColor blueColor],[UIColor blackColor],[UIColor grayColor]];

    for (int i=0; i<5; i++) {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, self.view.frame.size.height)];
        view.backgroundColor=[colorArr objectAtIndex:i];
        [scrollView addSubview:view];
    }
    scrollView.pagingEnabled=YES;
    
    scrollView.delegate=self;
    
    scrollView.contentSize=CGSizeMake(self.view.frame.size.width*5, self.view.frame.size.height);
    
    [self.view addSubview:scrollView];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scroll{
    NSLog(@"offset is %f",scroll.contentOffset.x);
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
