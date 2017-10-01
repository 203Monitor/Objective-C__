//
//  ShopModel.h
//  waterfall
//
//  Created by 武国斌 on 2016/10/31.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShopModel : NSObject

@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *price;

@end
