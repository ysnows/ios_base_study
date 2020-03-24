//
//  MasonryDistributeView.m
//  sample
//
//  Created by ysnows on 2020/3/24.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MasonryDistributeView.h"

@interface MasonryDistributeView ()
@property(nonatomic, strong) NSMutableArray *viewsArr;
@end

@implementation MasonryDistributeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _viewsArr=@[].mutableCopy;
        
        for (int i=0; i<4; i++) {
            UIView *view=UIView.new;
            view.backgroundColor=[self randomColor];
            [self addSubview:view];
            [_viewsArr addObject:view];
        }
        
        int type= arc4random()%4;
        type=1;
        switch (type) {
            case 0:
                [_viewsArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
                
                [_viewsArr makeConstraints:^(MASConstraintMaker *make) {

                    make.top.equalTo(@60);
                    make.height.equalTo(@60);
                }];
                break;
            case 1:
                
                [_viewsArr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
                
                [_viewsArr makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(@60);
                    make.width.equalTo(@60);
                }];

                break;
            default:
                break;
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
