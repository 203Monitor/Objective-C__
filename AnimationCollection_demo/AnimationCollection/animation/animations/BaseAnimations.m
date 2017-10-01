//
//  BaseAnimations.m
//  AnimationCollection
//
//  Created by 武国斌 on 2016/11/2.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import "BaseAnimations.h"

@implementation BaseAnimations

+ (void)startAnimationWithView:(UIView *)view andBaseType:(BaseAnimationType)type  andSetting:(NSDictionary *)setting {
    switch (type) {
        case BaseAnimationTypeRotation:
            [BaseAnimations rotationWithView:view andSetting:setting];
            break;
            
        case BaseAnimationTypeBiggerAndFade:
            [BaseAnimations biggerAndFadeWithView:view andSetting:setting];
            break;
            
        default:
            break;
    }
}

+ (void)rotationWithView:(UIView *)view andSetting:(NSDictionary *)setting {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = [NSNumber numberWithFloat:0];
    animation.toValue = [NSNumber numberWithFloat:M_PI];
    [animation settingWithDictionary:setting];
    //animation.removedOnCompletion = NO; //完成后是否回到原来状态，如果为NO 就是停留在动画结束时的状态
    //animation.fillMode = kCAFillModeRemoved;//动画完成后返回到原来状态
    //animation.fillMode = kCAFillModeBackwards;
    animation.fillMode = kCAFillModeForwards;//当动画完成时，保留在动画结束的状态
    
    [view.layer addAnimation:animation forKey:nil];
}

+ (void)biggerAndFadeWithView:(UIView *)view andSetting:(NSDictionary *)setting {
    CABasicAnimation *animationX = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    animationX.fromValue = [NSNumber numberWithFloat:1];
    animationX.toValue = [NSNumber numberWithFloat:3];
    [animationX settingWithDictionary:setting];
    
    CABasicAnimation *animationY = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animationY.fromValue = [NSNumber numberWithFloat:1];
    animationY.toValue = [NSNumber numberWithFloat:3];
    [animationY settingWithDictionary:setting];
    
    CABasicAnimation *animationO = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animationO.fromValue = [NSNumber numberWithFloat:1];
    animationO.toValue = [NSNumber numberWithFloat:0];
    [animationO settingWithDictionary:setting];
    
    [view.layer addAnimation:animationX forKey:nil];
    [view.layer addAnimation:animationY forKey:nil];
    [view.layer addAnimation:animationO forKey:nil];
}

@end
