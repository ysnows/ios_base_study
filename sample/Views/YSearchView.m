//
//  YSearchView.m
//  sample
//
//  Created by ysnows on 2020/3/20.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "YSearchView.h"
#import "YUIScreen.h"

@interface YSearchView ()<UITextFieldDelegate>
@property(nonatomic, strong) UITextField *searchView;

@end

@implementation YSearchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.layer.masksToBounds=YES;
        self.layer.cornerRadius=frame.size.height/2;
        self.backgroundColor=[UIColor whiteColor];
        [self addSubview:({
            
            _searchView= [[UITextField alloc]initWithFrame:CGRectMake(UI(10), UI(5), frame.size.width-UI(10)*2, frame.size.height-UI(5)*2)];
            
            _searchView.placeholder=@"今日热门搜索";
            _searchView.delegate=self;

            _searchView.leftView= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search"]];
            _searchView.leftViewMode= UITextFieldViewModeAlways;
            
            _searchView.clearButtonMode=UITextFieldViewModeWhileEditing;
            
            _searchView;
        })];
    }
    return self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"begin editing");
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"end editing");
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    NSLog(@"changing");
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    NSLog(@"return");
    
    [textField resignFirstResponder];
    return YES;
}




@end
