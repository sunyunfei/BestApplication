//
//  BaseNavViewController.h
//  jiaolian
//
//  Created by 脑洞 ios on 14/12/1.
//  Copyright (c) 2014年 脑洞 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavViewController : UINavigationController

@property(nonatomic,weak) UIViewController* currentShowVC;

/*
 
 *  @brief   
 *
 
 *  @param
 
 *
 
 *  @return
 */

@property (nonatomic,strong) UIView * barBacView;

@end
