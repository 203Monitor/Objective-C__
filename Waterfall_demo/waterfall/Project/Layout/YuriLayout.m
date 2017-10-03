//
//  YuriLayout.m
//  waterfall
//
//  Created by 武国斌 on 2016/10/31.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import "YuriLayout.h"

@interface YuriLayout ()

@property (nonatomic,strong) NSMutableArray *attributesArray;   //存放所有cell的布局属性
@property (nonatomic,strong) NSMutableArray *allColumnMaxYArray; //所有列的高度
@property (nonatomic,assign) CGFloat contentSizeHeight;   //内容的高度

@end

@implementation YuriLayout

- (NSMutableArray *)attributesArray {
    if (!_attributesArray) {
        _attributesArray = [NSMutableArray array];
    }
    return _attributesArray;
}

- (NSMutableArray *)allColumnMaxYArray {
    if (!_allColumnMaxYArray) {
        _allColumnMaxYArray  = [NSMutableArray array];
    }
    return _allColumnMaxYArray;
}

- (void)prepareLayout {
    [super prepareLayout];
    self.contentSizeHeight = 0;
    //先清空数组
    [self.allColumnMaxYArray removeAllObjects];
    for (NSInteger i = 0; i < self.self.columnCount; i++) {
        [self.allColumnMaxYArray addObject:@(self.self.edge.top)];
    }
    //开始创建每一个cell对应的布局属性
    //一共有多少个cell
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        //获取i位置上的索引
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        //获取每个cell的布局属性
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        //添加
        [self.attributesArray addObject:attributes];
    }
}

/**
 *  这个方法会多次调用
 */
//cell的排布
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributesArray;
}

//indexPath对应cell的布局属性
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    //为这个cell创建布局属性
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    //collectionViewW
    CGFloat collectionViewW = self.collectionView.frame.size.width;
    //找出高度最短的那一列
    NSInteger column = 0;
    //默认第一列的高度最短
    CGFloat minColumnHeight = [self.allColumnMaxYArray[0] doubleValue];
    //遍历数组所有值
    for (NSInteger i = 1; i < self.self.columnCount; i++) {
        //取出每一列的高度
        CGFloat columnHeight = [self.allColumnMaxYArray[i] doubleValue];
        //判断高度
        if (minColumnHeight >columnHeight) {
            minColumnHeight = columnHeight;
            //最短列赋值给columnY
            column = i;
        }
    }
    
    //设置布局
    CGFloat w = (collectionViewW - self.edge.left - self.edge.right - (self.columnCount - 1)*self.columnMargin) / self.columnCount;
    CGFloat x = self.edge.left + column * (w + self.columnMargin);
    CGFloat y = minColumnHeight;
    //如果不是第一行时
    if (y != self.edge.top) {
        y += self.rowMargin;
    }
    //高度由外界决定,通过delegate
    CGFloat h = [self.delegate yuriLayout:self heightForRowAtIndexPath:indexPath.row itemWidth:w];
    //设置frame
    attributes.frame = CGRectMake(x, y, w, h);
    //更新最短列的高度
    self.allColumnMaxYArray[column] = @(CGRectGetMaxY(attributes.frame));
    //记录最大高度
    CGFloat columHeight = [self.allColumnMaxYArray[column] doubleValue];
    if (self.contentSizeHeight < columHeight) {
        self.contentSizeHeight = columHeight;
    }
    return attributes;
}

//collectionView的ContentSize
- (CGSize)collectionViewContentSize {
    //最大高度+self.edge底部高度
    return CGSizeMake(0, self.contentSizeHeight+self.edge.bottom);
}

@end
