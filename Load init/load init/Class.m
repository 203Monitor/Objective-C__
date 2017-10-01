//
//  Class.m
//  load init
//
//  Created by 武国斌 on 2017/9/27.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import "Class.h"

/******* Implementation *******/
@implementation SuperClass

+ (void) initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void) load {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end

@implementation ChildClass

+ (void) initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
//    Insideinitialize * obj = [[Insideinitialize alloc] init];
//    [obj objectMethod];
}

//+ (void) load {
//    NSLog(@"%@ %s", [self class], __FUNCTION__);
//}

@end

@implementation Insideinitialize

- (void)objectMethod {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void) initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void) load {
    NSLog(@"%s", __FUNCTION__);
//    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end

@implementation Insideinitializechild

+ (void) load {
//    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end



