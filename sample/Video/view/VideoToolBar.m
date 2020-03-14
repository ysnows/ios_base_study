//
//  VideoToolBar.m
//  sample
//
//  Created by ysnows on 2020/3/14.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "VideoToolBar.h"

@interface VideoToolBar ()
@property(nonatomic, strong) UIImageView *imgName;
@property(nonatomic, strong) UIImageView *imgComment;
@property(nonatomic, strong) UIImageView *imgPraise;
@property(nonatomic, strong) UIImageView *imgShare;

@property(nonatomic, strong) UILabel *lName;
@property(nonatomic, strong) UILabel *lComment;
@property(nonatomic, strong) UILabel *lPraise;
@property(nonatomic, strong) UILabel *lShare;


@end

@implementation VideoToolBar


- (void)layoutWithModel:(id)model{
    
    _imgName.image=[UIImage imageNamed:@"icon.bundle/icon.png"];
    _lName.text=@"极客时间";

    _imgComment.image=[UIImage imageNamed:@"comment"];
    _lComment.text=@"100";
    
    _imgPraise.image=[UIImage imageNamed:@"praise"];
    _lPraise.text=@"25";
    
    _imgShare.image=[UIImage imageNamed:@"share"];
    _lShare.text=@"分享";
    
    [NSLayoutConstraint activateConstraints:@[
       [NSLayoutConstraint constraintWithItem:_imgName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0],
       
       [NSLayoutConstraint constraintWithItem:_imgName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:15],
       
       [NSLayoutConstraint constraintWithItem:_imgName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
       
       [NSLayoutConstraint constraintWithItem:_imgName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:30],
       
       [NSLayoutConstraint constraintWithItem:_lName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:_imgName attribute:NSLayoutAttributeRight multiplier:1 constant:0],
       
       [NSLayoutConstraint constraintWithItem:_lName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0  ]
    ]];
    
    
    NSString *vflString=@"H:|-15-[_imgName]-0-[_lName]-(>=0)-[_imgComment(==_imgName)]-0-[_lComment]-15-[_imgPraise(==_imgName)]-0-[_lPraise]-15-[_imgShare(==_imgName)]-0-[_lShare]-15-|";

    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vflString options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_imgName,_imgComment,_imgPraise,_imgShare,_lName,_lComment,_lPraise,_lShare)]];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:({
            _imgName=[[UIImageView alloc]initWithFrame:CGRectZero];
            _imgName.layer.cornerRadius=15;
            [_imgName.layer masksToBounds];
            _imgName.translatesAutoresizingMaskIntoConstraints=NO;
            
            _imgName;
        })];
        
        
        [self addSubview:({
            _imgComment=[[UIImageView alloc]initWithFrame:CGRectZero];
            _imgComment.layer.cornerRadius=15;
           [_imgComment.layer masksToBounds];
            _imgComment.translatesAutoresizingMaskIntoConstraints=NO;
            _imgComment;
        })];
        [self addSubview:({
            _imgPraise=[[UIImageView alloc]initWithFrame:CGRectZero];
            _imgPraise.layer.cornerRadius=15;
           [_imgPraise.layer masksToBounds];
            _imgPraise.translatesAutoresizingMaskIntoConstraints=NO;
            _imgPraise;
        })];
        [self addSubview:({
            _imgShare=[[UIImageView alloc]initWithFrame:CGRectZero];
            _imgShare.layer.cornerRadius=15;
           [_imgShare.layer masksToBounds];
            _imgShare.translatesAutoresizingMaskIntoConstraints=NO;
            _imgShare;
        })];
        
        
        [self addSubview:({
            _lName=[[UILabel alloc]init];
            _lName.layer.cornerRadius=15;
            _lName.translatesAutoresizingMaskIntoConstraints=NO;
            _lName.font=[UIFont systemFontOfSize:15];
            _lName.textColor=[UIColor lightGrayColor];
            _lName;
        })];
        
        [self addSubview:({
            
            _lComment=[[UILabel alloc]init];
            _lComment.layer.cornerRadius=15;
            _lComment.translatesAutoresizingMaskIntoConstraints=NO;
            _lComment.font=[UIFont systemFontOfSize:15];
            _lComment.textColor=[UIColor lightGrayColor];
            _lComment;
        })];
        [self addSubview:({
            _lPraise=[[UILabel alloc]init];
            _lPraise.layer.cornerRadius=15;
            _lPraise.translatesAutoresizingMaskIntoConstraints=NO;
            _lPraise.font=[UIFont systemFontOfSize:15];
            _lPraise.textColor=[UIColor lightGrayColor];
            _lPraise;
        })];
        
        [self addSubview:({
            _lShare=[[UILabel alloc]init];
            _lShare.layer.cornerRadius=15;
            _lShare.translatesAutoresizingMaskIntoConstraints=NO;
            _lShare.font=[UIFont systemFontOfSize:15];
            _lShare.textColor=[UIColor lightGrayColor];
            _lShare;
        })];

    }
    return self;
}




@end
