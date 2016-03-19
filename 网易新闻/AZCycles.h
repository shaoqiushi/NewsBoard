//
//  AZCycles.h
//  网易新闻
//
//  Created by AzeryKiss on 16/1/31.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^lalaBlock)(NSArray *cycleList);


@interface AZCycles : NSObject



//标题
@property (nonatomic, copy) NSString *title;

//图片
@property (nonatomic, copy) NSString *imgsrc;

+ (void)cycleListWithURLStr:(NSString *)urlStr completeBlock:(lalaBlock)completeBlock;



@end
