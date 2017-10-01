//
//  ViewController.m
//  sms
//
//  Created by 武国斌 on 16/1/9.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>

@interface ViewController () <MFMessageComposeViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    系统短信界面的调用很简单，只需下面几句代码
    MFMessageComposeViewController * con = [[MFMessageComposeViewController alloc]init];
    if ([MFMessageComposeViewController canSendText]) {
        con.recipients=@[@"10086"];//电话数组
        con.body = @"";
        con.messageComposeDelegate=self;
        [self presentViewController:con animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
