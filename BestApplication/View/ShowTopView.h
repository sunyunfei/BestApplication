//
//  ShowTopView.h
//  BestApplication
//
//  Created by 孙云 on 16/4/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowTopView : UIView
//底层的view
@property (weak, nonatomic) IBOutlet UIView *latterView;
//上层的view
@property (weak, nonatomic) IBOutlet UIView *formerView;
//上层view里面的label
@property (weak, nonatomic) IBOutlet UILabel *formerLabel;
//底层显示时间的label
@property (weak, nonatomic) IBOutlet UILabel *latterTimerLabel;
//底层显示排名的label
@property (weak, nonatomic) IBOutlet UILabel *latterRankLbel;
//点击底层view事件
- (IBAction)clickLatterBtn:(UIButton *)sender;
//点击菜单事件
- (IBAction)clickMenuBtn:(UIButton *)sender;
//加载nib
+ (instancetype)createView;

@end
