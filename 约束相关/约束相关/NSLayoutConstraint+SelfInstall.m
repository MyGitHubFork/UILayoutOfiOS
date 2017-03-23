//
//  NSLayoutConstraint+SelfInstall.m
//  约束相关
//
//  Created by huangchengdu on 17/3/23.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import "NSLayoutConstraint+SelfInstall.h"
#import "NSLayoutConstraint+ViewHierarchy.h"
#import "UIView+HierarchySupport.h"
@implementation NSLayoutConstraint (SelfInstall)
-(BOOL)install{
    if ([self isUnary]) {
        [self.firstView addConstraint:self];
        return YES;
    }
    UIView *view = [self.firstView nearestCommonAncestorToView:self.secondView];
    if (!view) {
        return NO;
    }
    [view addConstraint:self];
    return YES;
}

-(BOOL)isUnary{
    if (self.secondView) {
        return false;
    }
    return true;
}
-(BOOL)install:(float)priority{
    self.priority = priority;
    return [self install];
}

-(void)remove{
    if ([self isUnary]) {
        UIView *view = [self firstView];
        [view removeConstraint:self];
        return;
    }
    UIView *view = [self.firstView nearestCommonAncestorToView:self.secondView];
    if (!view) {
        return;
    }
    [view removeConstraint:self];
}

@end
