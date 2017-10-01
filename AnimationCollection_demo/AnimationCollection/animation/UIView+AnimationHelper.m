//
//  UIView+AnimationHelper.m
//  gradientLayer
//
//  Created by 武国斌 on 2016/11/1.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import "UIView+AnimationHelper.h"
#import "GradientAnimation.h"
#import "BaseAnimations.h"

@implementation UIView (AnimationHelper)

- (void)startAnimationType:(AnimationType)type andSetting:(NSDictionary *)setting {
    switch (type) {
        case AnimationTypeGradientAnimation:
            [GradientAnimation startAnimationWithView:self andSetting:setting];
            break;
            
        case AnimationTypeBaseRotation:
            [BaseAnimations startAnimationWithView:self andBaseType:BaseAnimationTypeRotation andSetting:setting];
            break;
            
        case AnimationTypeBaseBiggerAndFade:
            [BaseAnimations startAnimationWithView:self andBaseType:BaseAnimationTypeBiggerAndFade andSetting:setting];
            break;
            
        default:
            break;
    }
}

- (void)stopAnimation {
    if(self.layer.mask && [[[[self layer] mask] animationKeys] count] > 0) {
        for (NSString * key in [[[self layer] mask] animationKeys]) {
            [self.layer.mask removeAnimationForKey:key];
        }
        self.layer.mask = nil;
    }
    [self.layer removeAllAnimations];
}

@end
