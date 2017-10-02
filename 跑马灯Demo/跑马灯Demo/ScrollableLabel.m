//
//  ScrollableLabel.m
//  跑马灯Demo
//
//  Created by 武国斌 on 2017/10/2.
//  Copyright © 2017年 武国斌. All rights reserved.
//

#import "ScrollableLabel.h"
#import "NSString+Size.h"
#import "UIView+Position.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

@interface ScrollableLabel ()

@property (strong, nonatomic) UILabel *mainLabel;
@property (strong, nonatomic) UILabel *extraLabel;

@end

@implementation ScrollableLabel

- (UILabel *)mainLabel {
    if (!_mainLabel) {
        _mainLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    return _mainLabel;
}

- (UILabel *)extraLabel {
    if (!_extraLabel) {
        _extraLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    }
    return _extraLabel;
}

- (void)setString:(NSString *)string {
    _string = string;
    [self initView];
}

- (void)initView {
    [self setClipsToBounds:YES];

    [self addSubview:self.mainLabel];
    [self.mainLabel setText:self.string];
    [self.mainLabel sizeToFit];
    
    CGSize size = [self.string sizeWithFont:self.mainLabel.font andMaxSize:CGSizeMake(0, self.mainLabel.bounds.size.height)];
    
    [self setHeight:size.height];
    
    if (size.width > self.bounds.size.width) {
        [self addSubview:self.extraLabel];
        [self.extraLabel setText:self.string];
        [self.extraLabel sizeToFit];
        
        [self.extraLabel setLeft:size.width + 10];
    }
}

- (void)move {
    CGSize size = [self.string sizeWithFont:self.mainLabel.font andMaxSize:CGSizeMake(0, self.mainLabel.bounds.size.height)];
    
    WS(weakSelf);
    
    [UIView animateWithDuration:5.0f animations:^{
        [weakSelf.mainLabel setLeft:-(size.width + 10)];
        NSLog(@"main start");
    } completion:^(BOOL finished) {
        [weakSelf.mainLabel setLeft:(0)];
        NSLog(@"main back");
    }];
    
    [UIView animateWithDuration:5.0f animations:^{
        [weakSelf.extraLabel setLeft:(0)];
        NSLog(@"extra start");
    } completion:^(BOOL finished) {
        [weakSelf.extraLabel setLeft:(size.width + 10)];
        NSLog(@"extra back");
    }];
}

@end
