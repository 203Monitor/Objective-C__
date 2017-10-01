//
//  BaseAnimations.h
//  AnimationCollection
//
//  Created by 武国斌 on 2016/11/2.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CABasicAnimation+Yuri.h"

typedef enum : NSUInteger {
    BaseAnimationTypeRotation,
    BaseAnimationTypeBiggerAndFade,
} BaseAnimationType;

@interface BaseAnimations : NSObject

+ (void)startAnimationWithView:(UIView *)view andBaseType:(BaseAnimationType)type  andSetting:(NSDictionary *)setting;

@end
