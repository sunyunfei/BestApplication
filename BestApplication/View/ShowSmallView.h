//
//  ShowSmallView.h
//  BestApplication
//
//  Created by 孙云 on 16/4/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowSmallView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong,nonnull)NSArray *dateArray;
@end
