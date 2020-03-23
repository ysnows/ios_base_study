//
//  MasonryremakeView.m
//  sample
//
//  Created by ysnows on 2020/3/23.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MasonryremakeView.h"

@interface MasonryremakeView ()

@property(nonatomic, strong) UIButton *btn;
@property (nonatomic, assign) BOOL topLeft;


@end

@implementation MasonryremakeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:({
            _btn=[[UIButton alloc]init];
            _btn.layer.borderColor=UIColor.greenColor.CGColor;
            _btn.layer.borderWidth=3;
            [_btn setTitle:@"Move Me!" forState:UIControlStateNormal];
            [_btn addTarget:self action:@selector(_remakeConstraints) forControlEvents:UIControlEventTouchUpInside];
            _btn;
        })];

    }
    
    self.topLeft=YES;
    return self;
}

- (void)updateConstraints {
    UIView *superview=self;
    
        [_btn remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(100));
            make.height.equalTo(@(100));

            if (self->_topLeft) {
                make.top.equalTo(superview.top).offset(10);
                make.left.equalTo(superview.left).offset(10);
            }else{
                make.bottom.equalTo(superview.bottom).offset(-10);
                make.right.equalTo(superview.right).offset(-10);
            }
        }];

    [super updateConstraints];
}


+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}


-(void)_remakeConstraints{
    
    self.topLeft = !self.topLeft;
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.4f animations:^{
        [self layoutIfNeeded];
    }];

}

@end
