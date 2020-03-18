//
//  UIImageView+Circle.m
//  sample
//
//  Created by ysnows on 2020/3/18.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "UIImageView+Circle.h"

@implementation UIImageView(Circle)


- (void)asCircle{
    self.layer.masksToBounds=YES;
    self.layer.cornerRadius=self.bounds.size.width/2;
}

@end
