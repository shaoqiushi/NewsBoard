//
//  AZTopics.m
//  网易新闻
//
//  Created by AzeryKiss on 16/1/30.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import "AZTopics.h"

@implementation AZTopics

- (void)setTid:(NSString *)tid{
    _tid = tid;
    if ([tid isEqualToString:@"T1348647853363"]) {
        _urlStr = @"article/headline/T1348647853363/0-40.html";
    } else {
        _urlStr = [NSString stringWithFormat:@"article/list/%@/0-40.html",_tid];
    }
}

+ (instancetype)instanceWithDict:(NSDictionary *)dict{
    AZTopics *topic = [[AZTopics alloc] init];
    topic.tid = dict[@"tid"];
    topic.tname = dict[@"tname"];
    return topic;
}

+ (NSArray *)topics
{
    
    NSDictionary *topicsDict = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil ]] options:0 error:NULL];
    
    NSArray *topicsArray = topicsDict[@"tList"];
    
    NSMutableArray *topicArrayM = [NSMutableArray array];
    
    [topicsArray enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        AZTopics *topic = [self instanceWithDict:obj];
        
        [topicArrayM addObject:topic];
    }];
    
    
    return topicArrayM.copy;
}
- (NSString *)description{
    return [NSString stringWithFormat:@"%@, %@", self.tid, self.tname];
}


@end
