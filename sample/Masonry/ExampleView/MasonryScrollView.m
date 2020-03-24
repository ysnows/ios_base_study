//
//  MasonryScrollView.m
//  sample
//
//  Created by ysnows on 2020/3/24.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MasonryScrollView.h"

@interface MasonryScrollView ()
@property(nonatomic, strong) UIScrollView *scrollView;

@end

@implementation MasonryScrollView


- (instancetype)init
{
    self = [super init];
    if (self) {
        _scrollView = UIScrollView.new;
        _scrollView.backgroundColor=UIColor.grayColor;
        [self addSubview:_scrollView];
        
        [_scrollView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];

        UIView *contentView=UIView.new;
        contentView.backgroundColor=UIColor.redColor;
        [_scrollView addSubview:contentView];
        
        [contentView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self->_scrollView);
            make.width.equalTo(self->_scrollView);
        }];

        UIView *lastView;
        int height=20;

        for (int i = 0; i<10; i++) {
            UIView *view=UIView.new;
            view.backgroundColor=[self randomColor];
            [contentView addSubview:view];
            [view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_viewClick:)]];

            [view makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(self.width);
                make.left.equalTo(self.left);
                make.top.equalTo(lastView?lastView.bottom:@0);
                make.height.equalTo(@(height));
            }];

            height+=20;
            lastView=view;
        }

        [contentView makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(lastView.bottom);
        }];
    }
    return self;
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

-(void)_viewClick:(UITapGestureRecognizer *) sender{
   [sender.view setAlpha:sender.view.alpha/1.2];
   [_scrollView scrollRectToVisible:sender.view.frame animated:YES];
}
@end
