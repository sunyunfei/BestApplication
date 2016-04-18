//
//  ShowBigView.h
//  BestApplication
//
//  Created by 孙云 on 16/4/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowBigView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong,nonnull)NSArray *dateArray;
@property(nonatomic,strong)UICollectionView * _Nullable collectionView;
@property(nonatomic,copy,nonnull)void(^pushBlock)();
@end
