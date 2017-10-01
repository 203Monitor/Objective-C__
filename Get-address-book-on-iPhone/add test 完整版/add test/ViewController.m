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

    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    
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
                
                phonenum = ABRecordCopyValue(person, kABPersonPhoneProperty);
                NSString * personPhone = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phonenum, 0);
                
                if (firstName == nil) {
                    firstName = @"";
                }
                if (lastName == nil) {
                    lastName = @"";
                }
                NSLog(@"%@",[NSString stringWithFormat:@"%@%@:%@",lastName,firstName,personPhone]);
                NSLog(@"===============");
            }
        }
    }
}

@end