//
//  AZTopics.h
//  网易新闻
//
//  Created by AzeryKiss on 16/1/30.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AZTopics : NSObject

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *urlStr;

+ (NSArray *)topics;

@end
