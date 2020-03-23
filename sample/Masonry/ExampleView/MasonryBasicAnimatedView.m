//
//  MasonryBasicAnimatedView.m
//  sample
//
//  Created by ysnows on 2020/3/23.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MasonryBasicAnimatedView.h"

@interface MasonryBasicAnimatedView ()

@property(nonatomic, assign) BOOL animating;
@property(nonatomic, strong) NSMutableArray *animatableConstraits;

@end

@implementation MasonryBasicAnimatedView


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _animatableConstraits = NSMutableArray.new;
        
        UIView *greenView=UIView.new;
        greenView.backgroundColor=UIColor.greenColor;
        greenView.layer.borderColor=UIColor.blackColor.CGColor;
        greenView.layer.borderWidth=2;
        [self addSubview:greenView];
        
        
        UIView *redView=UIView.new;
        redView.backgroundColor=UIColor.redColor;
        redView.layer.borderColor=UIColor.blackColor.CGColor;
        redView.layer.borderWidth=2;
        [self addSubview:redView];
        
        UIView *blueView=UIView.new;
        blueView.backgroundColor=UIColor.blueColor;
        blueView.layer.borderColor=UIColor.blackColor.CGColor;
        blueView.layer.borderWidth=2;
        [self addSubview:blueView];
        
        UIView *superView=self;
        int padding=10;
        
        UIEdgeInsets paddingInsets=UIEdgeInsetsMake(padding, padding, padding, padding);
       
        [greenView makeConstraints:^(MASConstraintMaker *make) {
            [self->_animatableConstraits addObjectsFromArray:@[
                make.edges.equalTo(superView).insets(paddingInsets).priorityLow(),
                make.right.equalTo(redView.left),
                make.bottom.equalTo(blueView.top)
            ]];

            make.size.equalTo(redView);
        }];
        
        [redView makeConstraints:^(MASConstraintMaker *make) {
            
            [self->_animatableConstraits addObjectsFromArray:@[
                make.edges.equalTo(superView).insets(paddingInsets).priorityLow(),
                make.left.equalTo(greenView.right),
                make.bottom.equalTo(blueView.top)
            ]];

            make.size.equalTo(greenView);
        }];
        
        [blueView makeConstraints:^(MASConstraintMaker *make) {
            
            [self->_animatableConstraits addObjectsFromArray:@[
                make.edges.equalTo(superView).insets(paddingInsets).priorityLow(),
                make.top.equalTo(@[greenView.bottom,redView.bottom])
            ]];
            

            make.height.equalTo(@[greenView.height,redView.height]);
        }];
    }
    return self;
}


- (void)didMoveToWindow{
    if (self.window) {
        [self _toAnimate:NO];
    }
}

- (void)willMoveToWindow:(UIWindow *)newWindow{

}

-(void)_toAnimate:(BOOL) reverted{

    int padding=reverted?100:10;
    UIEdgeInsets paddingInsets=UIEdgeInsetsMake(padding, padding, padding, padding);
    
    for (MASConstraint *constraint in self.animatableConstraits) {
        constraint.insets=paddingInsets;
    }
    
    [UIView animateWithDuration:1 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self _toAnimate:!reverted];
    }];

}

@end
