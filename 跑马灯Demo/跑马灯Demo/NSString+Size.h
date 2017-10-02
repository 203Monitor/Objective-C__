//
//  NSString+Size.h
//  跑马灯Demo
//
//  Created by 武国斌 on 2017/10/2.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)

/**
 计算文本的大小

 @param font 文本字体
 @param size 文本区域最小尺寸，需计算一边写0
 @return 文本实际尺寸
 */
- (CGSize)sizeWithFont:(UIFont*)font andMaxSize:(CGSize)size;

/**
 计算文本的大小

 @param str 文本
 @param font 文本字体
 @param size 文本区域最小尺寸，需计算一边写0
 @return 文本实际尺寸
 */
+ (CGSize)sizeWithString:(NSString*)str andFont:(UIFont*)font andMaxSize:(CGSize)size;

@end
