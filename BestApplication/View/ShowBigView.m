//
//  ShowBigView.m
//  BestApplication
//
//  Created by 孙云 on 16/4/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ShowBigView.h"
#import "ShowBigCell.h"
#import "Common.h"
#import "ShowTopView.h"

static NSString * const CELL = @"ShowBigCell";
@implementation ShowBigView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        //注册单元格
        self.backgroundColor = [UIColor clearColor];
        [self initCollectionView];
        [self initTopView];
        //设置格式
        [self setLayout];
        //接收通知
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeCellIndex:) name:SmallToBigNot object:nil];
    }
    return self;
}
/**
 *  头部视图
 */
- (void)initTopView{

    ShowTopView *topView = [ShowTopView createView];
    topView.frame = CGRectMake(0, 30, self.frame.size.width, 30);
    [self addSubview:topView];
}
/**
 *  加载九宫格
 */
- (void)initCollectionView{

    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 60, self.frame.size.width, self.frame.size.height - 60) collectionViewLayout:[UICollectionViewFlowLayout new]];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
    [_collectionView registerNib:[UINib nibWithNibName:CELL bundle:nil] forCellWithReuseIdentifier:CELL];
    [self addSubview:_collectionView];
}
/**
 *  通知事件
 *
 *  @param sender <#sender description#>
 */
- (void)changeCellIndex:(NSNotification *)sender{

    NSDictionary *dic = sender.userInfo;
    NSInteger index = [dic[@"index"] integerValue];
    [_collectionView setContentOffset:CGPointMake(index * self.frame.size.width, 0) animated:YES];
}
/**
 *  设置格式
 */
- (void)setLayout{

    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.itemSize = CGSizeMake(self.frame.size.width - 10, _collectionView.frame.size.height);
    flow.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    [_collectionView setCollectionViewLayout:flow animated:YES];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ShowBigCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL forIndexPath:indexPath];
    //cell.label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}
/**
 *  选中
 *
 *  @param collectionView <#collectionView description#>
 *  @param indexPath      <#indexPath description#>
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (self.pushBlock) {
        self.pushBlock();
    }
}
//获得现在是第几个cell
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSInteger index = scrollView.contentOffset.x / KSCREEN_WIDTH;
    //发出一个通知，让底部滑动
    NSDictionary *dic = @{@"index":@(index)};
    [[NSNotificationCenter defaultCenter]postNotificationName:BigToSmallNot object:nil userInfo:dic];
}
@end
