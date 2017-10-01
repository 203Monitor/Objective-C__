//
//  ViewController.m
//  ButtonCanChangeAction
//
//  Created by 武国斌 on 2016/11/3.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+ChangeAction.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setBackgroundColor:[UIColor cyanColor]];
    [btn setFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:btn];
    [btn setTapAction:^(UIButton *button){
        NSLog(@"first bind");
    }];
    
    [btn setTapAction:^(UIButton *button){
        NSLog(@"second  bind");
    }];
    
    [btn setTapAction:^(UIButton *button){
        NSLog(@"third  bind");
    }];
    
    [btn addTarget:self action:@selector(do) forControlEvents:UIControlEventTouchUpInside];
}

- (void)do {
    NSLog(@"add new");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
