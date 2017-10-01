//
//  UIControl+ChangeAction.h
//  ButtonCanChangeAction
//
//  Created by 武国斌 on 2016/11/3.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapAction)(UIButton *button);

@interface UIButton (ChangeAction)

@property (nonatomic, copy) TapAction tapAction;

@end
