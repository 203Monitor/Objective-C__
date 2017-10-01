//
//  GradientAnimation.m
//  gradientLayer
//
//  Created by 武国斌 on 2016/11/1.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import "GradientAnimation.h"

@implementation GradientAnimation

+ (void)startAnimationWithView:(UIView *)view andSetting:(NSDictionary *)setting {

    CGFloat gradientSize = 0.3;
    
    CAGradientLayer *layer = [CAGradientLayer layer];
    [layer setFrame:[view bounds]];
    
    NSArray *startLocations = @[
                                @0,
                                @(gradientSize / 2.),
                                @(gradientSize)
                                ];
    NSArray *endLocations = @[
                              @((1. - gradientSize)),
                              @(1. - (gradientSize / 2.)),
                              @1
                              ];
    
    UIColor *shadowBackgroundColor = [[view backgroundColor] colorWithAlphaComponent:0.6];
    UIColor *shadowForegroundColor = [view backgroundColor];
    
    layer.colors = @[
                     (id)shadowBackgroundColor.CGColor,
                     (id)shadowForegroundColor.CGColor,
                     (id)shadowBackgroundColor.CGColor
                     ];
    
    layer.locations = startLocations;
    layer.startPoint = CGPointMake(0 - (gradientSize * 2), .5);
    layer.endPoint = CGPointMake(1 + gradientSize, .5);
    
    view.layer.mask = layer;
    
    CABasicAnimation *currentAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    currentAnimation.fromValue = startLocations;
    currentAnimation.toValue = endLocations;
    
    [currentAnimation settingWithDictionary:setting];
    
    [layer addAnimation:currentAnimation forKey:@"GradientAnimation"];
}

@end
