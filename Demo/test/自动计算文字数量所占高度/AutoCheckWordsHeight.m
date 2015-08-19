//
//  AutoCheckWordsHeight.m
//  Project_oschina
//
//  Created by haoRan on 15/1/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AutoCheckWordsHeight.h"

#define IOS7 [[[UIDevice currentDevice]systemVersion]doubleValue]>=7.0

#define IOS8 [[[UIDevice currentDevice]systemVersion]doubleValue] >= 8.0

@implementation AutoCheckWordsHeight

/*
 适配:屏幕大小,系统版本(UI,方法)
 */
+(CGSize)sizeOfStr:(NSString *)str withFont:(UIFont *)font withMaxWidth:(CGFloat)width withLineBreakMode:(NSLineBreakMode)mode
{
   // NSLog(@"%f",[[[UIDevice currentDevice]systemVersion]doubleValue]);
    
    if (IOS7) {
        CGSize size = [str boundingRectWithSize:CGSizeMake(width, 0) options:3 attributes:@{NSFontAttributeName: font} context:nil].size;
        return size;
    }
    else
    {
        CGSize size = [str sizeWithFont:font constrainedToSize:CGSizeMake(width, 999999) lineBreakMode:NSLineBreakByWordWrapping];
        return size;
    }
}

/**
 *  单行文本
 *
 *  @param str <#str description#>
 *
 *  @return <#return value description#>
 */
+ (CGSize)oneLineTextLongWithStr:(NSString *)str withFont:(UIFont *)font
{
    if (IOS8) {
        
        CGSize size = [str sizeWithAttributes:@{NSFontAttributeName:font}];
        return size;
        
    }
    else
    {
        CGSize size = [str sizeWithFont:font];
        return size;
    }
    
}

@end
