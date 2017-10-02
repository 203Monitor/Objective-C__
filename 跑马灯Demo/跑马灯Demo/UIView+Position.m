//
//  UIView+Position.m
//  跑马灯Demo
//
//  Created by 武国斌 on 2017/10/2.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import "UIView+Position.h"

@implementation UIView (Position)

- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    [self setFrame:frame];
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - self.bounds.size.width;
    [self setFrame:frame];
}

- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    [self setFrame:frame];
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.bounds.size.height;
    [self setFrame:frame];
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    [self setFrame:frame];
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    [self setFrame:frame];
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    [self setCenter:center];
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    [self setCenter:center];
}

@end
