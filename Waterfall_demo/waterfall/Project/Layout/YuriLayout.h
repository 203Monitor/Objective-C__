//
//  YuriLayout.h
//  waterfall
//
//  Created by 武国斌 on 2016/10/31.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YuriLayout;

//协议
@protocol YuriLayoutDelegate <NSObject>

//代理方法 返回item的高度
- (CGFloat)yuriLayout:(YuriLayout *)yuriLayout heightForRowAtIndexPath:(NSInteger )index itemWidth:(CGFloat )itemWidth;

@end

@interface YuriLayout : UICollectionViewLayout

@property (nonatomic,assign) CGFloat columnMargin;//列间距
@property (nonatomic,assign) CGFloat rowMargin;//行间距
@property (nonatomic,assign) UIEdgeInsets edge;//边缘间距
@property (nonatomic,assign) NSInteger columnCount;//列数
@property (nonatomic,assign) id<YuriLayoutDelegate> delegate;//代理

@end
 
