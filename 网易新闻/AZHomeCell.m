//
//  AZHomeCell.m
//  网易新闻
//
//  Created by AzeryKiss on 16/1/30.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import "AZHomeCell.h"
#import <UIImageView+WebCache.h>

@interface AZHomeCell ()
@property (weak, nonatomic) IBOutlet UIImageView *firstImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UILabel *zan;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageGroup;

@end

@implementation AZHomeCell

- (void)setNewsModel:(AZNewsModel *)newsModel{
    _newsModel = newsModel;
    
    self.titleLabel.text = newsModel.title;
    [self.firstImage sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc]];
    self.subTitle.text = newsModel.digest;
    self.zan.text = [NSString stringWithFormat:@"%d",newsModel.replyCount];
    
    if (newsModel.imgextra.count == 2) {
        NSArray *dictArray = newsModel.imgextra;
        for (int i = 0; i < dictArray.count; i++) {
            NSDictionary *dict = dictArray[i];
            NSString *extraImageURLString = dict[@"imgsrc"];
            UIImageView *imageView = self.imageGroup[i];
            [imageView sd_setImageWithURL:[NSURL URLWithString:extraImageURLString]];
        }
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

@end
