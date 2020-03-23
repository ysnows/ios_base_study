//
//  MasonryAspectView.m
//  sample
//
//  Created by ysnows on 2020/3/23.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MasonryAspectView.h"

@interface MasonryAspectView ()

@property(nonatomic, strong) UIView *topView;
@property(nonatomic, strong) UIView *topInnerView;
@property(nonatomic, strong) UIView *bottomView;
@property(nonatomic, strong) UIView *bottomInnerView;

@end

@implementation MasonryAspectView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _topView=[[UIView alloc]initWithFrame:CGRectZero];
        UIColor *blueColor = [UIColor colorWithRed:0.663 green:0.796 blue:0.996 alpha:1];
        _topView.backgroundColor=blueColor;
        
        UIColor *lightGreenColor = [UIColor colorWithRed:0.784 green:0.992 blue:0.851 alpha:1];
        _topInnerView=[[UIView alloc]initWithFrame:CGRectZero];
        _topInnerView.backgroundColor=lightGreenColor;
        
        
        _bottomView=[[UIView alloc]initWithFrame:CGRectZero];
        UIColor *pinkColor = [UIColor colorWithRed:0.992 green:0.804 blue:0.941 alpha:1];
        _bottomView.backgroundColor=pinkColor;

        
        UIColor *darkGreenColor = [UIColor colorWithRed:0.443 green:0.780 blue:0.337 alpha:1];
        _bottomInnerView=[[UIView alloc]initWithFrame:CGRectZero];
        _bottomInnerView.backgroundColor=darkGreenColor;
        
        
        UIView *superview=self;
        
        [self addSubview:_topView];
        [_topView makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.and.top.equalTo(superview);
        }];
        
        [self addSubview:_bottomView];
        [_bottomView makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.and.bottom.equalTo(superview);
            make.top.equalTo(self.topView.bottom);
            make.height.equalTo(self.topView);
        }];
        
        [self addSubview:_topInnerView];
        [_topInnerView makeConstraints:^(MASConstraintMaker *make) {

//            make.width.and.height.lessThanOrEqualTo(self.topView);
            
            make.width.and.height.equalTo(self.topView).with.priorityLow();
            make.center.equalTo(self.topView);
            make.width.multipliedBy(3).equalTo(self.topInnerView.mas_height);
            
        }];
        
        
        [self addSubview:_bottomInnerView];
        [_bottomInnerView makeConstraints:^(MASConstraintMaker *make) {


//            make.width.and.height.lessThanOrEqualTo(self.bottomView);
            make.width.and.height.equalTo(self.bottomView).with.priorityLow();
            make.center.equalTo(self.bottomView);
            make.height.equalTo(self.bottomInnerView.mas_width).multipliedBy(9);
        }];

    }
    return self;
}

@end
