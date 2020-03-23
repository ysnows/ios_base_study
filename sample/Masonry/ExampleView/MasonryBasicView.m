//
//  MasonryBasicView.m
//  sample
//
//  Created by ysnows on 2020/3/21.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MasonryBasicView.h"

@interface MasonryBasicView ()
@property(nonatomic, strong) UIView *greenView;
@property(nonatomic, strong) UIView *redView;
@property(nonatomic, strong) UIView *blueView;

@end


@implementation MasonryBasicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _greenView= [[UIView alloc]init];
            _greenView.backgroundColor=[UIColor greenColor];
            _greenView.layer.borderColor=UIColor.blackColor.CGColor;
            _greenView.layer.borderWidth=2;
            _greenView;
        })];

        
        [self addSubview:({
            _redView= [[UIView alloc]init];
            _redView.backgroundColor=[UIColor redColor];
            _redView.layer.borderColor=UIColor.blackColor.CGColor;
            _redView.layer.borderWidth=2;
            _redView;
        })];
        
        [self addSubview:({
            _blueView= [[UIView alloc]init];
            _blueView.backgroundColor=[UIColor blueColor];
            _blueView.layer.borderColor=UIColor.blackColor.CGColor;
            _blueView.layer.borderWidth=2;
            _blueView;
        })];
    }
    
    UIView *superview=self;
    int padding=10;
    
    [_greenView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.top).offset(padding);
        make.left.equalTo(superview.left).offset(padding);
        make.right.equalTo(self->_redView.left).offset(-padding);
        make.bottom.equalTo(self.blueView.top).offset(-padding);
        make.width.equalTo(self.redView.width);
        make.height.equalTo(self->_blueView.height);
    }];

    
    [_redView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.top).offset(padding);
        make.right.equalTo(superview.right).offset(-padding);
        make.left.equalTo(self->_greenView.right).offset(padding);
        make.bottom.equalTo(self.blueView.top).offset(-padding);
        make.width.equalTo(self->_greenView.width);
    }];

    [_blueView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.greenView.bottom).offset(padding);
        make.bottom.equalTo(superview.bottom).offset(-padding);
        make.left.equalTo(superview.left).offset(padding);
        make.height.equalTo(@[self.greenView,self.redView]);
        make.right.equalTo(superview.right).offset(-padding);
    }];
    
    return self;
}

@end
