//
//  TodayViewController.m
//  YToday
//
//  Created by ysnows on 2020/3/20.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:({
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        
        NSUserDefaults *todayDefaults=[[NSUserDefaults alloc]initWithSuiteName:@"group.com.ysnows.sample"];
        NSString *title = [todayDefaults objectForKey:@"title"];
        [btn setTitle:title forState:UIControlStateNormal];

        [btn setTintColor:[UIColor blackColor]];
        [btn addTarget:self action:@selector(_gotoContainingApp) forControlEvents:UIControlEventTouchUpInside];
        btn;
    })];

}

-(void)_gotoContainingApp{
    
    [self.extensionContext openURL:[NSURL URLWithString:@"testSchema://"] completionHandler:^(BOOL success) {
        
    }];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
