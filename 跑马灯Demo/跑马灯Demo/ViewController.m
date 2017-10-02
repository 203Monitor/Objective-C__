//
//  ViewController.m
//  跑马灯Demo
//
//  Created by 武国斌 on 2017/9/4.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import "ViewController.h"
#import "ScrollableLabel.h"
#import "UIView+Position.h"

@interface ViewController ()

@property (weak, nonatomic) ScrollableLabel *scrollableLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10,200, self.view.bounds.size.width, 100)];
//    label3.backgroundColor = [UIColor redColor];
//    label3.text =@"噜啦啦噜啦啦噜啦噜啦噜，噜啦噜啦噜啦噜啦噜啦噜~~~";
//    [self.view addSubview:label3];
//
//    CGRect frame = label3.frame;
//    frame.origin.x = -180;
//    label3.frame = frame;
//    [UIView beginAnimations:@"testAnimation"context:NULL];
//    [UIView setAnimationDuration:8.8f];
//    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//    [UIView setAnimationDelegate:self];
//    [UIView setAnimationRepeatAutoreverses:NO];
//    [UIView setAnimationRepeatCount:999999];
//    frame = label3.frame;
//    frame.origin.x =350;
//    label3.frame = frame;
//    [UIView commitAnimations];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;

    ScrollableLabel *scrollableLabel = [[ScrollableLabel alloc] initWithFrame:CGRectZero];
    [self.view addSubview:scrollableLabel];
    [scrollableLabel setString:@"start噜啦啦噜啦啦噜啦噜啦噜，噜啦噜啦"];
    [scrollableLabel setTop:100];
    [scrollableLabel setLeft:20];
    [scrollableLabel setWidth:width - 40];
    
    NSTimer *timer= [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(move) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    _scrollableLabel = scrollableLabel;
}

- (void)move {
    [_scrollableLabel move];
    NSLog(@"do");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
