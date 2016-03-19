//
//  AZCycles.m
//  网易新闻
//
//  Created by AzeryKiss on 16/1/31.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import "AZCycles.h"
#import "AZNetworkTool.h"
#import <objc/runtime.h>

@implementation AZCycles

+ (void)cycleListWithURLStr:(NSString *)urlStr completeBlock:(lalaBlock)completeBlock{
    
    [[AZNetworkTool sharedNetWorkTools] objectWithURLString:urlStr completeBlock:^(id object) {
       
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dictObj = (NSDictionary *)object;
        
            NSArray *dictArray = dictObj[@"headline_ad"];

            NSMutableArray *arrayM = [NSMutableArray array];
            
            for (NSDictionary *dict in dictArray) {
                [arrayM addObject:[self cycleWithDict:dict]];
            }
            if (completeBlock) {
                completeBlock(arrayM.copy);
            }
        
        }
        
    }];
    
    
}

+ (NSArray *)cyclename{
    
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList(self, &count);
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        const char *name = property_getName(property);
        NSString *ocName = [[NSString alloc] initWithCString:name encoding:NSUTF8StringEncoding];
        [mArray addObject:ocName];
    }
    free(propertyList);
    return mArray.copy;
}

+ (instancetype)cycleWithDict:(NSDictionary *)dict{
 
    AZCycles *cycleM = [[self alloc] init];
    
    [[self cyclename] enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [cycleM setValue:dict[obj] forKey:obj];
        
    }];
    
    return cycleM;
}




@end
