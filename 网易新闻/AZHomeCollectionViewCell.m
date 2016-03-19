//
//  AZHomeCollectionViewCell.m
//  网易新闻
//
//  Created by AzeryKiss on 16/1/30.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import "AZHomeCollectionViewCell.h"
#import "AZHomeTableViewController.h"

@interface AZHomeCollectionViewCell ()

@property (nonatomic, strong) AZHomeTableViewController *homeTableVc;

@end

@implementation AZHomeCollectionViewCell


- (void)awakeFromNib{
        self.contentView.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    UIStoryboard *newSb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
    
    self.homeTableVc  = [newSb instantiateInitialViewController];
    
    self.homeTableVc.tableView.frame = self.contentView.bounds;
    
    [self.contentView addSubview:self.homeTableVc.tableView];
}

- (void)setUrlStr:(NSString *)urlStr{
    
    _urlStr = urlStr;
    
    self.homeTableVc.urlStr = urlStr;
    
}

@end
