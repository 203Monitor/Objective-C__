//
//  CollectionViewCell.h
//  waterfall
//
//  Created by 武国斌 on 2016/10/31.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopModel.h"

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *img;
- (void)setCellBasicInfoWithModel:(ShopModel *)model;

@end
