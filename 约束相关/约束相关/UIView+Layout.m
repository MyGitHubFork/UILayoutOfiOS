//
//  UIView+Layout.m
//  约束相关
//
//  Created by huangchengdu on 17/3/23.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView (Layout)
-(void)testAmbiguity{
    NSLog(@"<%@:0x%0x>: %@",self.class.description,(int)self,self.hasAmbiguousLayout?@"约束不充分":@"约束完整");
    for (UIView *view in self.subviews) {
        [view testAmbiguity];
    }
}

-(NSArray *)allConstraints{
    NSMutableArray *arr = [NSMutableArray new];
    [arr addObjectsFromArray:self.constraints];
    for (UIView *view in self.subviews) {
        [arr addObjectsFromArray:view.constraints];
    }
    return arr;
}
@end
