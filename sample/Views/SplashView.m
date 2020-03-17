//
//  SplashView.m
//  sample
//
//  Created by ysnows on 2020/3/16.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "SplashView.h"
#import "YUIScreen.h"

@implementation SplashView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image=[UIImage imageNamed:@"icon.bundle/splash.png"];
        
        [self addSubview:({
            UIButton *button=[[UIButton alloc]initWithFrame:UIRect(300, 80, 60, 30)];
            [button setTitle:@"跳过" forState:UIControlStateNormal];
            button.backgroundColor=[UIColor lightGrayColor];
            [button addTarget:self action:@selector(_skipClick) forControlEvents:UIControlEventTouchUpInside];
            [self setUserInteractionEnabled:YES];
            button;
        })];

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self _skipClick];
        });
    }
    return self;
}


-(void)_skipClick{
    
    [self removeFromSuperview];
}

@end
