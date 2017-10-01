//
//  ViewController.m
//  waterfall
//
//  Created by 武国斌 on 2016/10/31.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import "ViewController.h"
#import "YuriLayout.h"
#import "ShopModel.h"
#import "CollectionViewCell.h"

//#define itemWidth ([[UIScreen mainScreen] bounds].size.width - 30)
@interface ViewController () <UICollectionViewDataSource,YuriLayoutDelegate>

@property (nonatomic, strong) UICollectionView *fall;
@property (nonatomic,strong) NSMutableArray *shopModelArray;

@end

@implementation ViewController

- (UICollectionView *)fall {
    if (!_fall) {
        YuriLayout *layout = [[YuriLayout alloc] init];
        layout.delegate = self;
//        layout.columnCount = 4;
//        layout.columnMargin = 10;
//        layout.rowMargin = 10;
//        layout.edge = UIEdgeInsetsMake(10, 10, 10, 10);
        
        layout.columnCount = 3;
        layout.columnMargin = 10;
        layout.rowMargin = 10;
        layout.edge = UIEdgeInsetsMake(10, 10, 10, 10);
        
        _fall = [[UICollectionView alloc] initWithFrame:[[UIScreen mainScreen] bounds] collectionViewLayout:layout];
        [_fall setDataSource:self];
        [_fall setBackgroundColor:[UIColor whiteColor]];
        [_fall registerNib:[UINib nibWithNibName:NSStringFromClass([CollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"shop"];
    }
    return _fall;
}

- (NSMutableArray *)shopModelArray {
    if (!_shopModelArray) {
        _shopModelArray = [NSMutableArray array];
    }
    return _shopModelArray;
}

- (void)setData {
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data.plist" ofType:nil]];
    for (NSDictionary *dic in array) {
        ShopModel *shop = [[ShopModel alloc] init];
        [shop setValuesForKeysWithDictionary:dic];
        [self.shopModelArray addObject:shop];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载数据
    [self setData];
    [self.view addSubview:self.fall];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.shopModelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shop" forIndexPath:indexPath];
    [cell setCellBasicInfoWithModel:self.shopModelArray[indexPath.row]];
    return cell;
}

#pragma mark -----yuriLayoutDelegate
- (CGFloat)yuriLayout:(YuriLayout *)yuriLayout heightForRowAtIndexPath:(NSInteger)index itemWidth:(CGFloat)itemWidth {
    ShopModel *shop = self.shopModelArray[index];
    return itemWidth * shop.h / shop.w;
}

@end
