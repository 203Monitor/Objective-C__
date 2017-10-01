//
//  CABasicAnimation+Yuri.m
//  AnimationCollection
//
//  Created by 武国斌 on 2016/11/2.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import "CABasicAnimation+Yuri.h"
#import "SettingTitle.h"

@implementation CABasicAnimation (Yuri)

- (void)settingWithDictionary:(NSDictionary *)setting {
    
    float repeatCount = 0;
    if (setting && setting[Animation_RepeatCount]) {
        repeatCount = [setting[Animation_RepeatCount] floatValue];
    }else {
//        repeatCount = INFINITY;
        repeatCount = 1;
    }
    self.repeatCount = repeatCount;
    
    float duration = 0;
    if (setting && setting[Animation_Duration]) {
        duration = [setting[Animation_Duration] floatValue];
    }else {
        duration = 1.f;
    }
    self.duration  = duration;
}

@end
