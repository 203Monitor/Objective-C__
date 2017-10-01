//
//  ViewController.m
//  test
//
//  Created by 武国斌 on 16/2/15.
//  Copyright © 2016年 武国斌. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UITextField *tf;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSDictionary *dic = @{@"a3":@"333",
                          @"a2":@"222",
                          @"a1":@"111"
                          };
    
    NSArray *arr = @[@"a1",@"a2",@"a3",@"a4"];
    for (NSString *str in arr) {
        if (!dic[str]) {
            NSLog(@"没有%@",str);
        }else {
            NSLog(@"有%@",str);
        }
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doo)];
    [self.view addGestureRecognizer:tap];
    
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    tf = [[UITextField alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-50, [UIScreen mainScreen].bounds.size.width, 50)];
    [tf setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:tf];
    
    //监听键盘状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //监听输入法状态
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeInputMode:) name:UITextInputCurrentInputModeDidChangeNotification object:nil];
}

#pragma mark Notification
//keyBoard已经展示出来
- (void)keyboardWillShow:(NSNotification *)notification
{
    NSValue* aValue = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    CGRect keyboardFrame = [self.view convertRect:keyboardRect fromView:[[UIApplication sharedApplication] keyWindow]];
    CGFloat keyboardHeight = keyboardFrame.size.height;
    NSLog(@"##keboardHeight=%.2f",keyboardHeight);
    CGRect rect = tf.frame;
    rect.origin.y = [UIScreen mainScreen].bounds.size.height-50-keyboardHeight;
    tf.frame = rect;
}

////输入法发生切换
//-(void)changeInputMode:(NSNotification *)notification{
//    NSString *inputMethod = [[UITextInputMode currentInputMode] primaryLanguage];
//    NSLog(@"inputMethod=%@",inputMethod);
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doo {
    [tf resignFirstResponder];
    [UIView animateWithDuration:0.3165 animations:^{
        CGRect rect = tf.frame;
        rect.origin.y = [UIScreen mainScreen].bounds.size.height-50;
        tf.frame = rect;
    }];
}

@end
