//
//  NewsTableViewCell.m
//  sample
//
//  Created by ysnows on 2020/2/8.
//  Copyright © 2020 ysnows. All rights reserved.
//

#import "NewsTableViewCell.h"

#import "NewsItem.h"
#import <SDWebImage/SDWebImage.h>
#import "YUIScreen.h"



@interface NewsTableViewCell ()

@property(strong,nonatomic,readwrite) UILabel *titleLabel;
@property(strong,nonatomic,readwrite) UILabel *sourceLabel;
@property(strong,nonatomic,readwrite) UILabel *commentLabel;
@property(strong,nonatomic,readwrite) UILabel *timeLabel;
@property(strong,nonatomic,readwrite) UIImageView *rightImageView;
@property(nonatomic, strong) UIButton *deleteButton;

@end

@implementation NewsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:({
            self.titleLabel=[[UILabel alloc]initWithFrame:UIRect(20, 5, 275, 50)];
            self.titleLabel.numberOfLines=2;
            self.titleLabel.lineBreakMode=NSLineBreakByTruncatingTail;
            self.titleLabel.font=[UIFont systemFontOfSize:16];
            self.titleLabel.textColor=[UIColor blackColor];
            self.titleLabel;
        })];

        
        [self addSubview:({
            
            self.sourceLabel=[[UILabel alloc]initWithFrame:UIRect(20, 100, 50, 20)];
            self.sourceLabel.font=[UIFont systemFontOfSize:12];
            self.sourceLabel.textColor=[UIColor grayColor];
            self.sourceLabel;
        })];

        [self addSubview:({
            self.commentLabel=[[UILabel alloc]initWithFrame:UIRect(80, 100, 50, 20)];
            self.commentLabel.font=[UIFont systemFontOfSize:12];
            self.commentLabel.textColor=[UIColor grayColor];
            self.commentLabel;
        })];
        
        [self addSubview:({
            self.timeLabel=[[UILabel alloc]initWithFrame:UIRect(140, 100, 50, 20)];
            self.timeLabel.font=[UIFont systemFontOfSize:12];
            self.timeLabel.textColor=[UIColor grayColor];
            self.timeLabel;
        })];
        
        [self addSubview:({
            self.rightImageView=[[UIImageView alloc]initWithFrame:UIRect(300, 30, 60, 60)];
            self.rightImageView.contentMode=UIViewContentModeScaleAspectFit;
            self.rightImageView;
        })];

//        [self addSubview:({
//            self.deleteButton=[[UIButton alloc]initWithFrame:UIRect(280, 100, 32, 32)];
//            [self.deleteButton setTitle:@"x" forState:UIControlStateNormal];
//            [self.deleteButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//            [self.deleteButton setTitle:@"v" forState:UIControlStateHighlighted];
//
//            _deleteButton.layer.cornerRadius=16;
//            _deleteButton.layer.masksToBounds=YES;
//            _deleteButton.layer.borderColor=[UIColor grayColor].CGColor;
//            _deleteButton.layer.borderWidth=2;
//
//            [self.deleteButton addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
//            self.deleteButton;
//        })];
        
    }
    return self;
}

-(void)setData:(NewsItem *) item{
    
    BOOL readed=[[NSUserDefaults standardUserDefaults]boolForKey:item.uniquekey];
    if (readed) {
        self.titleLabel.textColor=[UIColor lightGrayColor];
    }else{
        self.titleLabel.textColor=[UIColor blackColor];
    }

    self.titleLabel.text= item.title;
    
    self.sourceLabel.text=item.authorName;
    [self.sourceLabel sizeToFit];

    self.commentLabel.text=item.category;
    [self.commentLabel sizeToFit];
    
    self.commentLabel.frame=CGRectMake(self.sourceLabel.frame.origin.x+self.sourceLabel.frame.size.width+UI(10), self.sourceLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text=item.date;
    [self.timeLabel sizeToFit];

    self.timeLabel.frame=CGRectMake(self.commentLabel.frame.origin.x+self.commentLabel.frame.size.width+UI(10), self.sourceLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);

    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:item.thumbnailPicS] placeholderImage:[UIImage imageNamed:@"icon.bundle/icon.png"]];
    

//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.thumbnailPicS]]];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.rightImageView.image=image;
//        });
//    });
    
    
//    NSThread *downloadImageThread = [[NSThread alloc]initWithBlock:^{
//        UIImage *image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.thumbnailPicS]]];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.rightImageView.image=image;
//        });
//    }];
//    downloadImageThread.name=@"downloadImageThread";
//    [downloadImageThread start];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)deleteClick{
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
    
}

@end
