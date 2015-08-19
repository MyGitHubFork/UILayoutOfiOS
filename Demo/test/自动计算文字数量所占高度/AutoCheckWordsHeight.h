//
//  AutoCheckWordsHeight.h
//  Project_oschina
//
//  Created by haoRan on 15/1/14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AutoCheckWordsHeight : NSObject

/**
 *  返回多行文本的文字高度
 *
 *  @param str   <#str description#>
 *  @param font  <#font description#>
 *  @param width <#width description#>
 *  @param mode  <#mode description#>
 *
 *  @return <#return value description#>
 */
+(CGSize)sizeOfStr:(NSString *)str withFont:(UIFont *)font withMaxWidth:(CGFloat)width withLineBreakMode:(NSLineBreakMode)mode;

/**
 *  返回单行文本的长度
 *
 *  @param str <#str description#>
 *
 *  @return <#return value description#>
 */
+ (CGSize)oneLineTextLongWithStr:(NSString *)str withFont:(UIFont *)font;

@end
