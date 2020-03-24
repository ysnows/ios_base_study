//
//  MasonryMarginView.m
//  sample
//
//  Created by ysnows on 2020/3/24.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MasonryMarginView.h"

@implementation MasonryMarginView


- (instancetype)init
{
    self = [super init];
    if (self) {
        UIView *lastView=self;
        
//      UIEdgeInsets edgeInsets = UIEdgeInsetsMake(5, 10, 15, 20);
        
        for (int i=0; i<10; i++) {
            UIView *view=[UIView new];
            view.backgroundColor=[self randomColor];
            view.layer.borderColor=UIColor.blackColor.CGColor;
            view.layer.borderWidth=2;
            view.layoutMargins = UIEdgeInsetsMake(5, 10, 15, 20);
            [lastView addSubview:view];
            [view makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(lastView).offset(lastView.layoutMargins);
            }];
            lastView=view;
        }
    }
    return self;
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
