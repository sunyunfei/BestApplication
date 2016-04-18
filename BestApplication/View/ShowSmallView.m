//
//  ShowSmallView.m
//  BestApplication
//
//  Created by 孙云 on 16/4/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ShowSmallView.h"
#import "ShowSmallCell.h"
#import "Common.h"
static NSString * const CELL = @"ShowSmallCell";
#define K_WIDTH self.frame.size.width
#define K_HEIGHT self.frame.size.height
@implementation ShowSmallView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds = NO;
        self.delegate = self;
        self.dataSource = self;
        //注册单元格
        [self registerNib:[UINib nibWithNibName:CELL bundle:nil] forCellWithReuseIdentifier:CELL];
        //设置格式
        [self setCollectionViewLayout];
        //设置手势
        UILongPressGestureRecognizer *longGest = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longEvent:)];
        longGest.minimumPressDuration = 0;
        [self addGestureRecognizer:longGest];
        
        //接收通知
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeCellIndex:) name:BigToSmallNot object:nil];
        
    }
    return self;
}
/**
 *  通知方法
 *
 *  @param sender <#sender description#>
 */
- (void)changeCellIndex:(NSNotification *)sender{

    NSDictionary *dic = sender.userInfo;
    NSInteger index = [dic[@"index"] integerValue];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    [self selectedCellAnima:indexPath];
}

/**
 *  设置格式
 */
- (void)setCollectionViewLayout{
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.itemSize = CGSizeMake(K_WIDTH / 7, K_HEIGHT);
    flow.minimumInteritemSpacing = 0;
    flow.minimumLineSpacing = 0;
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self setCollectionViewLayout:flow animated:YES];
}
/**
 *  手势方法
 */
- (void)longEvent:(UITapGestureRecognizer *)sender{
    
    //首先获取长按的位置点
    CGPoint point = [sender locationInView:self];
    //获取所有的cell
    NSArray *cells = [self visibleCells];
    
    [cells enumerateObjectsUsingBlock:^(ShowSmallCell *cell, NSUInteger idx, BOOL * _Nonnull stop) {
        if (CGRectContainsPoint(cell.frame, point)) {
            NSIndexPath *cellIndex = [self indexPathForCell:cell];
            NSInteger num = cellIndex.item;
            for (NSInteger i = num - 4; i <num + 5; i++) {
                //判断
                if (i < 0 || i > 10) {
                    continue;
                }
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
                
                ShowSmallCell *sCell = (ShowSmallCell *)[self cellForItemAtIndexPath:indexPath];
                
                
                [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                    sCell.transform = CGAffineTransformMakeTranslation(0, -KSCREEN_HEIGHT * 1 / 9 + 5 + 10 * ABS(i - num));
                } completion:nil];
            }
        }
    }];
    //当结束长按时选择对应的cell
    if (sender.state == UIGestureRecognizerStateEnded) {
        for (ShowSmallCell *sCell in cells) {
            if (CGRectContainsPoint(sCell.frame, point)) {
                //做一个动画
                NSIndexPath *cellIndexPath = [self indexPathForCell:sCell];
                [self selectedCellAnima:cellIndexPath];
            }
        }
        
    }
}
- (void)selectedCellAnima:(NSIndexPath *)indexPath{
    
    for(NSInteger i = 0; i < 10; i ++){
        
        ShowSmallCell *sCell = (ShowSmallCell *)[self cellForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [UIView animateKeyframesWithDuration:0.1 delay:0.0 options:UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
            if (i == indexPath.item) {
                sCell.transform = CGAffineTransformMakeTranslation(0, - KSCREEN_HEIGHT * 1 / 9 + 5);
            }else{
                
                sCell.transform = CGAffineTransformIdentity;
            }
        } completion:nil];
    }
    
    //判断这个单元格现在的位置
    NSArray *cells = [self visibleCells];
    ShowSmallCell *cell = (ShowSmallCell *)[self cellForItemAtIndexPath:indexPath];
    if (indexPath.item >= 3 && indexPath.item < cells.count - 1) {
        [self setContentOffset:CGPointMake((indexPath.item - 3) * cell.frame.size.width, 0) animated:YES];
    }
    
    //发出一个通知
    NSDictionary *dic = @{@"index":@(indexPath.item)};
    [[NSNotificationCenter defaultCenter]postNotificationName:SmallToBigNot object:nil userInfo:dic];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ShowSmallCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    cell.iconImage.image = [UIImage imageNamed:@"2.jpg"];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self selectedCellAnima:indexPath];
}

- (void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
