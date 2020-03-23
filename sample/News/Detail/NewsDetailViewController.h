//
//  DetailViewController.h
//  sample
//
//  Created by ysnows on 2020/2/10.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailViewController : BaseViewController

- (instancetype)initWithUrl:(NSString *) url;
@end

NS_ASSUME_NONNULL_END
