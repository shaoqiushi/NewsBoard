//
//  AZNetworkTool.m
//  网易新闻
//
//  Created by AzeryKiss on 16/1/30.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import "AZNetworkTool.h"
#import <AFNetworking.h>

@implementation AZNetworkTool

static NSString * const NewsBoardBaseURLString = @"http://c.m.163.com/nc/";


static AZNetworkTool *_instance;
+ (instancetype)sharedNetWorkTools{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] initWithBaseURL:[NSURL URLWithString:NewsBoardBaseURLString]];
        _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return _instance;
}

- (void)objectWithURLString:(NSString *)URLString completeBlock:(CompleteBlock)completeBlock{
    [self GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (completeBlock) {
            completeBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error === %@", error);
    }];
}

@end
