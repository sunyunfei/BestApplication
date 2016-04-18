//
//  ShowBigCell.m
//  BestApplication
//
//  Created by 孙云 on 16/4/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ShowBigCell.h"

@implementation ShowBigCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}

@end
