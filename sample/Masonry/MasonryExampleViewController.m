//
//  MasonryExampleViewController.m
//  sample
//
//  Created by ysnows on 2020/3/21.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "MasonryExampleViewController.h"

@interface MasonryExampleViewController ()

@property(nonatomic, strong) Class viewClass;

@end

@implementation MasonryExampleViewController

- (instancetype)initWithTitle:(NSString*)title andClass:(Class) viewClass
{
    self = [super init];
    if (self) {
        self.title=title;
        self.viewClass=viewClass;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view=_viewClass.new;
    self.view.backgroundColor=[UIColor whiteColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
