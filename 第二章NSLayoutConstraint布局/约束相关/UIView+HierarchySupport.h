//
//  UIView+HierarchySupport.h
//  约束相关
//
//  Created by huangchengdu on 17/3/23.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HierarchySupport)
-(NSArray *)superviews;
-(BOOL)isAncestorOfView:(UIView *)aView;
-(UIView *)nearestCommonAncestorToView:(UIView *)aView;
@end
