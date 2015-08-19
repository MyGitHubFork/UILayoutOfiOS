//
//  MAYMiaoshaEntity.h
//  hhm
//
//  Created by yifan on 15/8/17.
//  Copyright (c) 2015年 maxwin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAYMiaoshaEntity : NSObject
@property(nonatomic,copy)NSString *CategoryName;
@property(nonatomic,copy)NSString *Color;
@property(nonatomic,copy)NSString *EndTime;
@property(nonatomic,copy)NSString *ImgUrl;
@property(nonatomic,assign)BOOL IsValid;
@property(nonatomic,strong)NSNumber *LimitBuyCount;
@property(nonatomic,copy)NSString *ProductGroupCode;
@property(nonatomic,copy)NSString *ProductName;
@property(nonatomic,strong)NSNumber *ProductSysNo;
@property(nonatomic,strong)NSNumber *RemainEndTotalSeconds;
@property(nonatomic,strong)NSNumber *RemainStartTotalSeconds;
@property(nonatomic,strong)NSNumber *SecKillPrice;
@property(nonatomic,copy)NSString *Size;
@property(nonatomic,copy)NSString *SkuCode;
@property(nonatomic,strong)NSNumber *SkuSysNo;
@property(nonatomic,copy)NSString *StartTime;
@property(nonatomic,strong)NSNumber *TotalCount;
@end
