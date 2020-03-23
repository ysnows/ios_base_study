//
//  MasonryConstantsView.m
//  sample
//
//  Created by ysnows on 2020/3/23.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MasonryConstantsView.h"

@implementation MasonryConstantsView


- (instancetype)init
{
    self = [super init];
    if (self) {
        UIView *purpleView= UIView.new;
        purpleView.backgroundColor=UIColor.purpleColor;
        purpleView.layer.borderColor=UIColor.blackColor.CGColor;
        purpleView.layer.borderWidth=2;
        [self addSubview:purpleView];
        
        UIView *orangeView= UIView.new;
        orangeView.backgroundColor=UIColor.orangeColor;
        orangeView.layer.borderColor=UIColor.blackColor.CGColor;
        orangeView.layer.borderWidth=2;
        [self addSubview:orangeView];

        [purpleView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@10);
            make.bottom.equalTo(@-10);
            make.left.equalTo(@10);
            make.right.equalTo(@-10);
        }];
        
        [orangeView makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(CGPointMake(100, -100));
            make.size.equalTo(CGSizeMake(200, 100));
        }];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
