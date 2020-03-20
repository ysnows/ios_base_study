//
//  YCommentBar.m
//  sample
//
//  Created by ysnows on 2020/3/20.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "YCommentBar.h"
#import <UIKit/UIKit.h>
#import "YUIScreen.h"

@interface YCommentBar ()

@property(nonatomic, strong) UIView *backgroundView;
@property(nonatomic, strong) UITextView *inputCommentView;

@end

@implementation YCommentBar

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static YCommentBar *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[super alloc] init];
    });
    return instance;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _backgroundView=[[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        _backgroundView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        [_backgroundView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_clickBg)]];
        
        [_backgroundView addSubview:({
            
            _inputCommentView=[[UITextView alloc]initWithFrame:CGRectMake(0, _backgroundView.frame.size.height, SCREEN_WIDTH, UI(50))];
            
            _inputCommentView.backgroundColor=[UIColor whiteColor];
            _inputCommentView.layer.borderColor=[UIColor lightGrayColor].CGColor;
            _inputCommentView;
        })];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_onKeyBoardStatusChanged:) name:UIKeyboardWillChangeFrameNotification object:nil];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)_clickBg{

    [_inputCommentView resignFirstResponder];
}

-(void)_onKeyBoardStatusChanged:(NSNotification *) notification{
    
    Float32 duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect endFrame = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    NSLog(@"%f",endFrame.origin.y);
    if (endFrame.origin.y>=SCREEN_HEIGHT) {
//        keyboard hide

        [UIView animateWithDuration:duration animations:^{
            self->_backgroundView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];
            self->_inputCommentView.frame=CGRectMake(0, self->_backgroundView.frame.size.height, SCREEN_WIDTH, UI(50));
        } completion:^(BOOL finished) {
            [self->_backgroundView removeFromSuperview];
        }];
    
        
    }else{
//        keyboard show
        
        self->_inputCommentView.frame=CGRectMake(0, _backgroundView.frame.size.height, SCREEN_WIDTH, UI(50));
        self->_backgroundView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0];

        [UIView animateWithDuration:duration animations:^{
            self->_backgroundView.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
            self->_inputCommentView.frame=CGRectMake(0, endFrame.origin.y-self->_inputCommentView.frame.size.height, SCREEN_WIDTH, self->_inputCommentView.frame.size.height);
        }];
    }


}

- (void)showCommentView{
    [_inputCommentView becomeFirstResponder];
    [[UIApplication sharedApplication].keyWindow addSubview:_backgroundView];
}

@end
