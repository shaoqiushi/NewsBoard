//
//  AZNewsModel.m
//  网易新闻
//
//  Created by AzeryKiss on 16/1/30.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import "AZNewsModel.h"
#import "AZNetworkTool.h"
#import <objc/runtime.h>

@implementation AZNewsModel


+ (instancetype)newWithDictionary:(NSDictionary *)dict{
    AZNewsModel *newM = [[AZNewsModel alloc] init];

    [[self getNameArray] enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL * _Nonnull stop) {
        if (dict[name] != nil) {

            [newM setValue:dict[name] forKey:name];
        }
    }];
    return newM;
}

+ (NSArray *)getNameArray{
    
//    AZNewsModel *newM = [[AZNewsModel alloc] init];
    
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList(self, &count);

    
    NSMutableArray *ocpropertyList = [NSMutableArray array];
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        
        const char *str = property_getName(property);
        
        NSString *name = [[NSString alloc] initWithCString:str encoding:NSUTF8StringEncoding];
        
        [ocpropertyList addObject:name];
//        NSLog(@"%@", ocpropertyList);
    }
    free(propertyList);
    return ocpropertyList.copy;
    
}

+ (void)newsListWithUrlStr:(NSString *)urlStr finishedBlock:(FinishedBlock)FinishedBlock{
    
    [[AZNetworkTool sharedNetWorkTools] objectWithURLString:urlStr completeBlock:^(id object) {
       
        if ([object isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *listDict = (NSDictionary *)object;
            
            NSString *str = listDict.keyEnumerator.nextObject;
            
            NSArray *listNews = listDict[str];
            
            NSMutableArray *finishArray = [NSMutableArray array];
            
            [listNews enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
               
               AZNewsModel *newM = [self newWithDictionary:obj];
                [finishArray addObject:newM];
                
            }];
            if (FinishedBlock) {
                FinishedBlock(finishArray.copy);
            }
        }
        
        
    }];
    
    
}

@end
