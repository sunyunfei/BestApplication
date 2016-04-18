//
//  ShowViewController.m
//  BestApplication
//
//  Created by 孙云 on 16/4/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ShowViewController.h"
#import "Common.h"
#import "ShowBigView.h"
#import "ShowSmallView.h"
#import "DetailsViewController.h"
@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:0.9879 green:0.2997 blue:0.0301 alpha:1.0];
    [self setShowBigView];
    [self setShowSmallView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setShowBigView{

    ShowBigView *bigView = [[ShowBigView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH, KSCREEN_HEIGHT * 7 / 8)];
    __block typeof(self)weakSelf = self;
    bigView.pushBlock = ^{
    
        DetailsViewController *detailVC = [[DetailsViewController alloc]init];
        [weakSelf.navigationController pushViewController:detailVC animated:NO];
    };
    [self.view addSubview:bigView];
}
- (void)setShowSmallView{

    ShowSmallView *smallView = [[ShowSmallView alloc]initWithFrame:CGRectMake(0, KSCREEN_HEIGHT - 10, KSCREEN_WIDTH, KSCREEN_HEIGHT * 1/ 8) collectionViewLayout:[UICollectionViewFlowLayout new]];
    [self.view addSubview:smallView];
}
@end
