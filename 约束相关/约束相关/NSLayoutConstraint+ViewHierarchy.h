//
//  NSLayoutConstraint+ViewHierarchy.h
//  约束相关
//
//  Created by huangchengdu on 17/3/23.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (ViewHierarchy)
@property(nonatomic,readonly)UIView *firstView;
@property(nonatomic,readonly)UIView *secondView;
@end
