//
//  AZHomeTableViewController.m
//  网易新闻
//
//  Created by AzeryKiss on 16/1/30.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import "AZHomeTableViewController.h"
#import "AZNetworkTool.h"
#import "AZNewsModel.h"
#import "AZHomeCell.h"

@interface AZHomeTableViewController ()

@property (nonatomic, strong) NSArray *innerNewsList;

@end

@implementation AZHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.allowsSelection = YES;
//    self.tableView.showsVerticalScrollIndicator = NO;
}

- (void)setUrlStr:(NSString *)urlStr{
    
    _urlStr = urlStr;
    
    __weak typeof(self) weakSelf = self;
    [AZNewsModel newsListWithUrlStr:urlStr finishedBlock:^(NSArray *newsList) {
        weakSelf.innerNewsList = newsList;
        
        [weakSelf.tableView reloadData];

    }];
        

    
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.innerNewsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     NSString *ID = @"baseCell";
    AZNewsModel *newM = self.innerNewsList[indexPath.row];
    if (newM.imgextra.count == 2) {
        ID = @"twoCell";
    } else if (newM.imgType ){
        ID = @"threeCell";
    }
    
    
    AZHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
//    if (cell == nil) {
//        cell =
//    }
    cell.newsModel = newM;
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    AZNewsModel *currentNews = self.innerNewsList[indexPath.row];
    
    if (currentNews.imgType) {//大图
        return 200;
    }else if(currentNews.imgextra.count==2){
        return 120;
    }else{
        return 80;
    }
}

@end
