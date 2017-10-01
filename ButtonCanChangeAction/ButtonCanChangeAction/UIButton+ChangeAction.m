//
//  UIControl+ChangeAction.m
//  ButtonCanChangeAction
//
//  Created by 武国斌 on 2016/11/3.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import "UIButton+ChangeAction.h"
#import <objc/runtime.h>

@implementation UIButton (ChangeAction)

static const char *UIControl_tapAction = "UIControl_tapAction";

- (TapAction)tapAction {
    return objc_getAssociatedObject(self, UIControl_tapAction);
}

- (void)setTapAction:(TapAction)tapAction {
    [self addTarget:self action:@selector(ok) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(self, UIControl_tapAction, tapAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)ok {
    self.tapAction(self);
}

+ (void)load{
    //获取着两个方法
    Method systemMethod = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    SEL sysSEL = @selector(sendAction:to:forEvent:);
    
    Method myMethod = class_getInstanceMethod(self, @selector(change_sendAction:to:forEvent:));
    SEL mySEL = @selector(change_sendAction:to:forEvent:);
    //添加方法进去
    BOOL didAddMethod = class_addMethod(self, sysSEL, method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
    //如果方法已经存在了
    if (didAddMethod) {
        class_replaceMethod(self, mySEL, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }else {
        method_exchangeImplementations(systemMethod, myMethod);
    }
    //----------------以上主要是实现两个方法的互换,load是gcd的只shareinstance，果断保证执行一次
}

- (void)change_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
//    if (NSDate.date.timeIntervalSince1970 - self.cjr_acceptEventTime < self.cjr_acceptEventInterval) {
//        return;
//    }
//    if (self.cjr_acceptEventInterval > 0) {
//        self.cjr_acceptEventTime = NSDate.date.timeIntervalSince1970;
//    }
    [self change_sendAction:action to:target forEvent:event];
}

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    static dispatch_once_t predicate; dispatch_once(&predicate, ^{
        [super addTarget:target action:action forControlEvents:controlEvents];
    });
}

@end
