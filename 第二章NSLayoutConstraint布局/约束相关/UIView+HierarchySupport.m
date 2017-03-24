//
//  UIView+HierarchySupport.m
//  约束相关
//
//  Created by huangchengdu on 17/3/23.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import "UIView+HierarchySupport.h"

@implementation UIView (HierarchySupport)
-(NSArray *)superviews{
    NSMutableArray *array = [NSMutableArray new];
    UIView *view = self.superview;
    if (view) {
        [array addObject:view];
        view = view.superview;
    }
    return array;
}
-(BOOL)isAncestorOfView:(UIView *)aView{
    
    return [[self superviews] containsObject:self];
}

-(UIView *)nearestCommonAncestorToView:(UIView *)aView{
    if ([self isEqual:aView]) {
        return self;
    }
    if ([self isAncestorOfView:aView]) {
        return self;
    }
    if ([aView isAncestorOfView:self]) {
        return aView;
    }
    NSArray *ancestor = [self superviews];
    for (UIView *view in [aView superviews]) {
        if ([ancestor containsObject:view]) {
            return view;
        }
    }
    return nil;
    
}
@end
