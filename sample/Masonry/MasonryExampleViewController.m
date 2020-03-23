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
    self.view.frame=CGRectMake(0, STATUSBARHEIGHT+40, SCREEN_WIDTH, self.view.frame.size.height);
    self.view.backgroundColor=[UIColor whiteColor];
    

}


#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif




@end
