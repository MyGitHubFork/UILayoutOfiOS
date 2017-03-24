//
//  NSLayoutConstraint+ViewHierarchy.m
//  约束相关
//
//  Created by huangchengdu on 17/3/23.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import "NSLayoutConstraint+ViewHierarchy.h"

@implementation NSLayoutConstraint (ViewHierarchy)
-(UIView *)firstView{
    return self.firstItem;
}
-(UIView *)secondView{
    return self.secondItem;
}
@end
