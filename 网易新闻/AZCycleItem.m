//
//  AZCycleItem.m
//  网易新闻
//
//  Created by AzeryKiss on 16/1/31.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import "AZCycleItem.h"
#import "AZCycles.h"
#import <UIImageView+WebCache.h>


@interface AZCycleItem ()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
@end

@implementation AZCycleItem

- (void)setCycle:(AZCycles *)cycle{
    _cycle = cycle;
    [self.itemImageView sd_setImageWithURL:[NSURL URLWithString:cycle.imgsrc]];
//    self.itemLabel.text = self.cycle.title;
    if (!self.first) {
        self.itemLabel.text = self.cycle.title;
    }
}

- (void)setTextLabel:(NSString *)textLabel{
    _textLabel = textLabel;
    self.itemLabel.text = self.textLabel;

}

@end
