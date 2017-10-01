//
//  CollectionViewCell.m
//  waterfall
//
//  Created by 武国斌 on 2016/10/31.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import "CollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.img setBackgroundColor:[UIColor blackColor]];
    [self.img setFrame:CGRectMake(0, 0, self.bounds.size.width,self.bounds.size.height)];
}

- (void)setCellBasicInfoWithModel:(ShopModel *)model {
    [self.img sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"loading"]];
}

@end
