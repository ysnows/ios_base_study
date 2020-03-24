//
//  MasonryArrView.m
//  sample
//
//  Created by ysnows on 2020/3/24.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MasonryArrView.h"


static CGFloat const kStep = 10.0;

@interface MasonryArrView ()

@property(nonatomic, strong) NSArray *viewsArr;
@property(nonatomic, assign) CGFloat offset;

@end

@implementation MasonryArrView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIButton *btnLower=[UIButton buttonWithType:UIButtonTypeSystem];
        [btnLower setTitle:@"Lower" forState:UIControlStateNormal];
        [btnLower addTarget:self action:@selector(_lowerClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnLower];
        
        [btnLower makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.left);
        }];
        
        UIButton *btnCenter=[UIButton buttonWithType:UIButtonTypeSystem];
        [btnCenter setTitle:@"Center" forState:UIControlStateNormal];
        [btnCenter addTarget:self action:@selector(_centerClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnCenter];
        
        [btnCenter makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.centerX);
        }];
        
        UIButton *btnRaise=[UIButton buttonWithType:UIButtonTypeSystem];
        [btnRaise setTitle:@"Raise" forState:UIControlStateNormal];
        [btnRaise addTarget:self action:@selector(_raiseClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnRaise];
        
        [btnRaise makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.right);
        }];
        
        _viewsArr=@[btnLower,btnCenter,btnRaise];
    }

    return self;
}




- (void)setOffset:(CGFloat)offset{
    _offset=offset;
    [self setNeedsUpdateConstraints];
}



- (void)updateConstraints {

    [self.viewsArr updateConstraints:^(MASConstraintMaker *make) {
        make.baseline.equalTo(self.centerY).with.offset(self.offset);
    }];
    
    [super updateConstraints];
}

-(void)_lowerClick{
    self.offset+=kStep;
}

-(void)_raiseClick{
    self.offset-=kStep;
}

-(void)_centerClick{
    self.offset=0.0;
}

@end
