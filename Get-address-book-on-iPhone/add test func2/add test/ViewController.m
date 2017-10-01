//
//  ViewController.m
//  add test
//
//  Created by Yuri19 on 15/11/26.
//  Copyright © 2015年 yuri. All rights reserved.
//

#import "ViewController.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    
    [self presentViewController:picker animated:YES completion:nil];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    ABAddressBookRef abr = [picker addressBook];
    if(abr) {
        //取出所有联系人信息
        CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(abr);
        if (people){
            UInt16 numberOfPersonsInAB = CFArrayGetCount(people);
            
            ABRecordRef person = nil;
            NSString *firstName = nil;
            NSString *lastName = nil;
            ABMultiValueRef phonenum = nil;

            for (UInt16 i = 0; i < numberOfPersonsInAB; i++) {
                person = CFArrayGetValueAtIndex(people, i);
                firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
                lastName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonCompositeNameFormatLastNameFirst);
                
                //读取电话多值
                phonenum = ABRecordCopyValue(person, kABPersonPhoneProperty);
                for (int k = 0; k<ABMultiValueGetCount(phonenum); k++)
                {
                    //获取电话Label
//                    NSString * personPhoneLabel = (__bridge NSString*)ABAddressBookCopyLocalizedLabel(ABMultiValueCopyLabelAtIndex(phonenum, k));
                    //获取該Label下的电话值
                    NSString * personPhone = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phonenum, k);
//                    NSLog(@"%@",[NSString stringWithFormat:@"%@:%@\n",personPhoneLabel,personPhone]);
                    NSLog(@"%@",personPhone);
                }
                
                
//                if (firstName == nil) {
//                    firstName = @"";
//                }
//                if (lastName == nil) {
//                    lastName = @"";
//                }
//                NSLog(@"%@",[NSString stringWithFormat:@"%@%@%@",lastName,firstName,phonenum]);
                
                NSLog(@"===============");
            }
        }
    }

    
}

@end