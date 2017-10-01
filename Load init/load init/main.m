//
//  main.m
//  load init
//
//  Created by 武国斌 on 2017/9/27.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Class.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        [Insideinitialize load];
//        [Insideinitialize initialize];
        
        [ChildClass initialize];
        [ChildClass load];
    }
    return 0;
}
