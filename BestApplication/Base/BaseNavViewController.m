//
//  BaseNavViewController.m
//  jiaolian
//
//  Created by 脑洞 ios on 14/12/1.
//  Copyright (c) 2014年 脑洞 ios. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation BaseNavViewController

@synthesize barBacView;
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationBar.barStyle= UIBarStyleDefault;
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    [self setNavgationAttributes];

    // Do any additional setup after loading the view.
}



-(id)initWithRootViewController:(UIViewController *)rootViewController
{
    BaseNavViewController * nvc                   = [super initWithRootViewController:rootViewController];
    
    //TEST
//    CGRect stateBarFrame                          = [UIApplication sharedApplication].statusBarFrame;
//    
//    CGRect navBarFrame                            = self.navigationBar.frame;
    
//    barBacView=[[UIView alloc] initWithFrame:CGRectMake(0, -CGRectGetHeight(stateBarFrame),CGRectGetWidth(stateBarFrame), CGRectGetHeight(stateBarFrame) + CGRectGetHeight(navBarFrame))];
//    
//    barBacView .backgroundColor                   = kColorNavBg_white;//[UIColor grayColor];
//    
//    [self.navigationBar addSubview:barBacView];
//    
//    [self.navigationBar sendSubviewToBack:barBacView];
    
//    if ([self respondsToSelector:@selector(barHideOnSwipeGestureRecognizer)]) {
////        self.hidesBarsOnSwipe = YES;
//    }
//    
    self.interactivePopGestureRecognizer.delegate = self;
    
    rootViewController.edgesForExtendedLayout     = UIRectEdgeNone;
    
    nvc.delegate                                  = self;
    

    
    return nvc;
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];

    if (viewController.edgesForExtendedLayout!=UIRectEdgeNone) {
        viewController.edgesForExtendedLayout = UIRectEdgeNone;
    }
}


-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}


-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (navigationController.viewControllers.count == 1)
        self.currentShowVC = Nil;
    else
        self.currentShowVC = viewController;
}


-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        return (self.currentShowVC == self.topViewController); //the most important
    }
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
