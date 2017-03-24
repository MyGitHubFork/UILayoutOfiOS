//
//  UIView+ConstraintMatching.h
//  约束相关
//
//  Created by huangchengdu on 17/3/23.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ConstraintMatching)
//找到第一个匹配的约束
-(NSLayoutConstraint *)constraintMatching:(NSLayoutConstraint *)aConstraint;
//匹配约束组的约束
-(NSArray *)constraintsMatchingConstraints:(NSArray *)constraints;
-(void)removeMatchingConstraint:(NSLayoutConstraint *)aConstraint;
-(void)removeMatchingConstraints:(NSArray *)aArray;
@end
