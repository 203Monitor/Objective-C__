//
//  Class.h
//  load init
//
//  Created by 武国斌 on 2017/9/27.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import <Foundation/Foundation.h>

/******* Interface *******/
@interface SuperClass : NSObject
@end

@interface ChildClass : SuperClass
@end

@interface Insideinitialize : NSObject
- (void)objectMethod;
@end

@interface Insideinitializechild : Insideinitialize
@end

