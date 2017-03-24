//
//  NSLayoutConstraint+ConstraintMatching.m
//  约束相关
//
//  Created by huangchengdu on 17/3/23.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import "NSLayoutConstraint+ConstraintMatching.h"

@implementation NSLayoutConstraint (ConstraintMatching)
-(BOOL)isEqualToLayoutConstraint:(NSLayoutConstraint *)constraint{
    if (self.firstItem != constraint.firstItem) {
        return NO;
    }
    if (self.secondItem != constraint.secondItem) {
        return NO;
    }
    if (self.firstAttribute != constraint.firstAttribute) {
        return NO;
    }
    if (self.secondAttribute != constraint.secondAttribute) {
        return NO;
    }
    if (self.relation != constraint.relation) {
        return NO;
    }
    if (self.multiplier != constraint.multiplier) {
        return NO;
    }
    if (self.constant != constraint.constant) {
        return NO;
    }
    return YES;
}
@end
