//
//  AZNetworkTool.h
//  网易新闻
//
//  Created by AzeryKiss on 16/1/30.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void(^CompleteBlock)(id object);

@interface AZNetworkTool : AFHTTPSessionManager

+ (instancetype)sharedNetWorkTools;

- (void)objectWithURLString:(NSString *)URLString completeBlock:(CompleteBlock)completeBlock;

@end
