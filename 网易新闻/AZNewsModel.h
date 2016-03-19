//
//  AZNewsModel.h
//  网易新闻
//
//  Created by AzeryKiss on 16/1/30.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FinishedBlock)(NSArray *newsList);

@interface AZNewsModel : NSObject

// 标题
@property (nonatomic, copy) NSString *title;
// 摘要
@property (nonatomic, copy) NSString *digest;
// 图片
@property (nonatomic, copy) NSString *imgsrc;
// 跟贴数
@property (nonatomic, assign) int replyCount;
// 多张配图
@property (nonatomic, strong) NSArray *imgextra;
// 大图标记
@property (nonatomic, assign) BOOL imgType;

+ (void)newsListWithUrlStr:(NSString *)urlStr finishedBlock:(FinishedBlock)FinishedBlock;

@end
