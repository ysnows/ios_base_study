//
//  MasonrySidesView.m
//  sample
//
//  Created by ysnows on 2020/3/23.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MasonrySidesView.h"

@interface MasonrySidesView ()


@end

@implementation MasonrySidesView

- (instancetype)init
{
    self = [super init];
    UIView *lastView=self;
    if (self) {
        for (int i=0; i<20; i++) {
            UIView *newView=UIView.new;
            newView.backgroundColor=[self randomColor];
            newView.layer.borderColor=UIColor.blackColor.CGColor;
            newView.layer.borderWidth=2;
            [lastView addSubview:newView];
            
            [newView makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
            }];

            lastView=newView;
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
