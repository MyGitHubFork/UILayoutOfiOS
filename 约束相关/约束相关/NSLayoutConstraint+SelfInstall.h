//
//  NSLayoutConstraint+SelfInstall.h
//  约束相关
//
//  Created by huangchengdu on 17/3/23.
//  Copyright © 2017年 huangchengdu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutConstraint (SelfInstall)
-(BOOL)install;
-(BOOL)install:(float)priority;
-(void)remove;
@end
