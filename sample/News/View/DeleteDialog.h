//
//  DeleteDialog.h
//  sample
//
//  Created by ysnows on 2020/2/14.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeleteDialog : UIView

-(void)show:(CGPoint) position withDeleted:(dispatch_block_t) deleted;
-(void)dismiss;

@end

NS_ASSUME_NONNULL_END
