//
//  ShowSmallCell.m
//  BestApplication
//
//  Created by 孙云 on 16/4/18.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "ShowSmallCell.h"

@implementation ShowSmallCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
    self.iconImage.layer.cornerRadius = 4;
    self.layer.masksToBounds = YES;
}

@end
