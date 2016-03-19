//
//  NewsViewController.m
//  网易新闻
//
//  Created by AzeryKiss on 16/1/30.
//  Copyright © 2016年 AzeryKiss. All rights reserved.
//

#import "NewsViewController.h"
#import "AZTopics.h"
#import "AZHomeCollectionViewCell.h"

@interface NewsViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property( nonatomic, strong) NSArray *topicArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation NewsViewController

-(NSArray *)topicArray{
    if (_topicArray == nil) {
        _topicArray = [AZTopics topics];
    }
    return _topicArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createScrollViewLabel];
    
    [self setFlowyout];
}

- (void)setFlowyout{
    self.flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 44);
}


- (void)createScrollViewLabel{
    CGFloat scrollH = self.scrollView.frame.size.height;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.topicArray enumerateObjectsUsingBlock:^(AZTopics *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:17];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = obj.tname;
        label.frame = CGRectMake(80 * idx, 0, 80, scrollH);
        [self.scrollView addSubview:label];
        
    }];
    self.scrollView.contentSize = CGSizeMake(self.topicArray.count * 80, 0);
    self.scrollView.backgroundColor = [UIColor purpleColor];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.topicArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ID = @"CollectionCellId";
    
    AZHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    
    AZTopics *topic = self.topicArray[indexPath.item];
    
    cell.urlStr = topic.urlStr;
    
    return cell;
    
}

@end
