//
//  DeleteDialog.m
//  sample
//
//  Created by ysnows on 2020/2/14.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "DeleteDialog.h"

@interface DeleteDialog ()
@property(nonatomic, strong) UIView *backgroundView;
@property(nonatomic, strong) UIButton *deleteButton;
@property(nonatomic, copy) dispatch_block_t deletedBlock;
@end

@implementation DeleteDialog

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _backgroundView=[[UIView alloc]initWithFrame:frame];
            _backgroundView.backgroundColor=[UIColor blackColor];
            _backgroundView.alpha=0.5f;
            
            [_backgroundView addGestureRecognizer:({
                UITapGestureRecognizer *recognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
                recognizer;
            })];
            
            _backgroundView;
        })];
        
        [self addSubview:({
            _deleteButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
            _deleteButton.backgroundColor=[UIColor redColor];
            [_deleteButton addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton;
        })];
    }
    return self;
}

- (void)show:(CGPoint)position withDeleted:(nonnull dispatch_block_t)deleted{
    _deletedBlock=[deleted copy];
    
    self->_deleteButton.frame=CGRectMake(position.x, position.y, 0, 0);
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:1.f delay:0 usingSpringWithDamping:0.5f initialSpringVelocity:0.5f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self->_deleteButton.frame=CGRectMake((self.frame.size.width-200)/2, (self.frame.size.height-200)/2, 200, 200);
        [self->_deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
    } completion:^(BOOL finished) {
        NSLog(@"finished");
    }];
}

- (void)dismiss{
    [self removeFromSuperview];
}

-(void)deleteClick{
    _deletedBlock();
    [self dismiss];
}
@end
