//
//  ViewController.m
//  AnimationCollection
//
//  Created by 武国斌 on 2016/11/1.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AnimationHelper.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *aniView;
@property (nonatomic, assign) BOOL ani;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.aniView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(175, 400, 100, 70)];
    [btn setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(startOtStop) forControlEvents:UIControlEventTouchUpInside];
    self.ani = NO;
}

- (void)startOtStop {
    if (self.ani) {
        [self.aniView stopAnimation];
        self.ani = NO;
    }else {
//        [self.aniView startAnimationType:AnimationTypeGradientAnimation andSetting:nil];
//        [self.aniView startAnimationType:AnimationTypeBaseBiggerAndFade andSetting:nil];
        [self.aniView startAnimationType:AnimationTypeBaseRotation andSetting:nil];
        self.ani = YES;
    }
}

- (UIView *)aniView {
    if (!_aniView) {
        _aniView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 375, 50)];
        [_aniView setBackgroundColor:[UIColor blueColor]];
    }
    return _aniView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
