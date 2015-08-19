//
//  MAYMiaoshaCell.h
//  test
//
//  Created by yifan on 15/8/18.
//  Copyright (c) 2015年 黄成都. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAYMiaoshaEntity.h"

@interface MAYMiaoshaCell : UITableViewCell
@property(nonatomic,strong)MAYMiaoshaEntity *entity;
@property (copy, nonatomic) void (^imageTapCallBack)(NSNumber *);
@end
