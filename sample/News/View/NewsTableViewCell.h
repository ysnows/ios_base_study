//
//  NewsTableViewCell.h
//  sample
//
//  Created by ysnows on 2020/2/8.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsItem;

NS_ASSUME_NONNULL_BEGIN

@protocol NewsTableViewCellDelegate <NSObject>
-(void)tableViewCell:(UITableViewCell *) cell clickDeleteButton:(UIButton *) deleteButton;
@end

@interface NewsTableViewCell : UITableViewCell

@property(nonatomic, weak) id<NewsTableViewCellDelegate> delegate;
-(void)setData:(NewsItem*) item;

@end

NS_ASSUME_NONNULL_END
