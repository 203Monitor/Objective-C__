//
//  ScrollableLabel.h
//  跑马灯Demo
//
//  Created by 武国斌 on 2017/10/2.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollableLabel : UIView

@property (strong, nonatomic) NSString *string;

- (void)move;

@end
