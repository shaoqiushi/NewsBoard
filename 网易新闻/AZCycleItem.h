//
//  AZCycleItem.h
//  网易新闻
//
//  Created by AzeryKiss on 16/1/31.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AZCycles;

@interface AZCycleItem : UICollectionViewCell
@property (nonatomic, strong) AZCycles *cycle;
@property (nonatomic, copy) NSString *textLabel;
@property (nonatomic, assign) NSInteger first;

@end
