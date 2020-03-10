//
//  MineViewController.m
//  sample
//
//  Created by ysnows on 2020/2/10.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()<UIGestureRecognizerDelegate>

@end

@implementation MineViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title=@"我的";
        self.tabBarItem.image=[UIImage imageNamed:@"icon.bundle/page@2x.png"];
        self.tabBarItem.selectedImage=[UIImage imageNamed:@"icon.bundle/page_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    
    
    [self.view addSubview:({
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100  )];
        view.backgroundColor=[UIColor redColor];
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
        tap.delegate=self;
        [view addGestureRecognizer:tap];
        view;
    })];
    // Do any additional setup after loading the view.
}


-(void)tapGesture{

    
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
