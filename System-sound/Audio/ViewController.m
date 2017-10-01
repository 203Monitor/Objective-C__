//
//  ViewController.m
//  Audio
//
//  Created by 武国斌 on 15/12/28.
//  Copyright © 2015年 武国斌. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController () <UIPickerViewDataSource,UIPickerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doo)];
//    [self.view addGestureRecognizer:tap];
    
    UIPickerView *picker = [[UIPickerView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:picker];
    picker.showsSelectionIndicator=YES;
    [picker setDelegate:self];
    [picker setDataSource:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 500;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%li",1000+row];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    unsigned int num = (int)1000+(int)row;
    AudioServicesPlaySystemSound (num);
}

- (void)doo {
    NSLog(@"ok");
    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);
}

@end
