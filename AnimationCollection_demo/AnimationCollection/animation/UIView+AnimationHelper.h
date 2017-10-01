//
//  UIView+AnimationHelper.h
//  gradientLayer
//
//  Created by 武国斌 on 2016/11/1.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingTitle.h"

typedef enum : NSUInteger {
    AnimationTypeGradientAnimation,
    AnimationTypeBaseRotation,
    AnimationTypeBaseBiggerAndFade,
} AnimationType;

@interface UIView (AnimationHelper)

- (void)startAnimationType:(AnimationType)type andSetting:(NSDictionary *)setting;
- (void)stopAnimation;

@end
