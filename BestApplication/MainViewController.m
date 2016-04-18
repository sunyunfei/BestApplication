//
//  ViewController.m
//  BestApplication
//
//  Created by 孙云 on 16/4/17.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "MainViewController.h"
#import "ShowViewController.h"
#import "Common.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    ShowViewController *showVC;
    BaseNavViewController *navShow;
    UITableView *bgTableView;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    [self setTableView];
    
    showVC = [[ShowViewController alloc]init];
    navShow = [[BaseNavViewController alloc]initWithRootViewController:showVC];
    [self.view addSubview:navShow.view];
    
    UIView *panView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, showVC.view.frame.size.height)];
    panView.backgroundColor = [UIColor clearColor];
    [showVC.view addSubview:panView];
     UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(changeViewPoint:)];
    [panView addGestureRecognizer:pan];
    //接收通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changePoint) name:TopMenuToMainNot object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  通知方法
 */
- (void)changePoint{

    [UIView animateWithDuration:0.1 animations:^{
        CGRect rect = navShow.view.frame;
        rect.origin.x = KSCREEN_WIDTH * 2 / 3;
        navShow.view.frame = rect;
        bgTableView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}
/**
 *  手势运动
 *
 *  @param sender <#sender description#>
 */
- (void)changeViewPoint:(UIPanGestureRecognizer *)sender{

    //得出拖拽的起点
    CGPoint point = [sender locationInView:self.view];
    if (sender.state == UIGestureRecognizerStateChanged) {
        //做动作
        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect = navShow.view.frame;
            rect.origin.x = point.x;
            navShow.view.frame = rect;
            
            CGFloat scaleX = point.x /(KSCREEN_WIDTH/ 2);
            if (scaleX >= 0.5) {
                scaleX = 0.5;
            }
            bgTableView.transform = CGAffineTransformMakeScale(0.5 + scaleX, 0.5 + scaleX);
        }];
    }else if (sender.state == UIGestureRecognizerStateEnded){
    
        if (point.x <= KSCREEN_WIDTH * 1/ 3) {
            point.x = 0.0;
        }else{
        
            point.x = KSCREEN_WIDTH * 2/ 3;
        }
        [UIView animateWithDuration:0.1 animations:^{
            CGRect rect = navShow.view.frame;
            rect.origin.x = point.x;
            navShow.view.frame = rect;
            
            CGFloat scaleX = point.x /(KSCREEN_WIDTH/ 2);
            if (scaleX >= 0.5) {
                scaleX = 0.5;
            }
            bgTableView.transform = CGAffineTransformMakeScale(0.5 + scaleX, 0.5 + scaleX);
        }];
    }
    
}
- (void)setTableView{

    bgTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KSCREEN_WIDTH *1/ 2, KSCREEN_HEIGHT)];
    bgTableView.delegate = self;
    bgTableView.dataSource = self;
    [self.view addSubview:bgTableView];
   
    bgTableView.transform = CGAffineTransformMakeScale(0.5, 0.5);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * const ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:ID];
    }
    cell.textLabel.text = @"cell";
    return cell;
}

- (void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
