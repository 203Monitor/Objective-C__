//
//  GradientAnimation.h
//  gradientLayer
//
//  Created by 武国斌 on 2016/11/1.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CABasicAnimation+Yuri.h"

@interface GradientAnimation : NSObject

+ (void)startAnimationWithView:(UIView *)view andSetting:(NSDictionary *)setting;

@end
