//
//  ShowTopView.m
//  BestApplication
//
//  Created by 孙云 on 16/4/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ShowTopView.h"
#import "Common.h"
@implementation ShowTopView

+ (instancetype)createView{

    return [[[NSBundle mainBundle]loadNibNamed:@"ShowTopView" owner:nil options:nil] lastObject];
}
/**
 *  点击菜单
 *
 *  @param sender <#sender description#>
 */
- (IBAction)clickMenuBtn:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:TopMenuToMainNot object:nil];
}
/**
 *  点击返回首页
 *
 *  @param sender sender description
 */
- (IBAction)clickLatterBtn:(UIButton *)sender {
    
}
@end
