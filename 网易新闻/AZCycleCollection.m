//
//  AZCycleCollection.m
//  网易新闻
//
//  Created by AzeryKiss on 16/3/19.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import "AZCycleCollection.h"
#import "AZCycles.h"
#import "AZCycleItem.h"


@interface AZCycleCollection ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *cycleArray;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *cycleFlowLayout;
@property (nonatomic, strong) AZCycleItem *currentItem;
//@property (nonatomic, assign) NSIndexPath *currentIndexPath;
@end

@implementation AZCycleCollection

static NSString * const reuseIdentifier = @"Cell";

- (void)awakeFromNib{
    self.showsHorizontalScrollIndicator = NO;
    
    self.dataSource = self;
    self.delegate = self;
    self.backgroundColor = [UIColor whiteColor];
    [self changeFlowLayout];
    
    [self postcycleModel];
}




// 改变flowlayout 的大小 在storyboard 获取不到屏幕的宽度
- (void)changeFlowLayout{
    self.cycleFlowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 250);
}

// 获得数据
- (void)postcycleModel{
    __weak typeof(self) weakSelf = self;
    [AZCycles cycleListWithURLStr:@"ad/headline/0-4.html" completeBlock:^(NSArray *cycleList) {
        weakSelf.cycleArray = cycleList;
        [self reloadData];
    }];
}


#pragma mark <UICollectionViewDataSource>

//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//    NSLog(@"我来啦");
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

//    CGFloat width = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
    
    for (int i = 0; i < 5; i++) {
        if (scrollView.contentOffset.x == [UIScreen mainScreen].bounds.size.width * i) {
//            NSLog(@"ok");
//            AZCycles *cycle = self.cycleArray[self.currentIndexPath.item];
            NSInteger currentPage = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
            AZCycles *cycle = self.cycleArray[currentPage];
            self.currentItem.textLabel = cycle.title;
//            NSLog(@"%zd", currentPage);
        }
    }
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.cycleArray.count;
}
static NSInteger currentNum = 0;
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AZCycleItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.cycle = self.cycleArray[indexPath.item];
    
    
    // 判断是否是第一次读取, 来给textLabel赋值
    cell.first = currentNum++;
    
//    self.currentIndexPath = indexPath;
    self.currentItem = cell;
    return cell;
}


@end
