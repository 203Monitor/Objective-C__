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

@property (nonatomic)ABPeoplePickerNavigationController *picker;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self btnClick];
}

- (void)btnClick
{
    if(!self.picker){
        self.picker = [[ABPeoplePickerNavigationController alloc] init];
//        self.picker.modalPresentationStyle = UIModalPresentationCurrentCont］
    }
    
    //显示一个viewcontroller
    [self presentViewController:self.picker animated:YES completion:nil];
    
    ABAddressBookRef abr = [_picker addressBook];
    if(abr) {
        //取出所有联系人信息
        CFArrayRef people = ABAddressBookCopyArrayOfAllPeople(abr);
        if (people){
            UInt16 numberOfPersonsInAB = CFArrayGetCount(people);
            
            ABRecordRef person = nil;
            NSString *firstName = nil;
            NSString *lastName = nil;
            
            for (UInt16 i = 0; i < numberOfPersonsInAB; i++) {
                person = CFArrayGetValueAtIndex(people, i);
                firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
                lastName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonCompositeNameFormatLastNameFirst);
                
                if (firstName == nil) {
                    firstName = @"";
                }
                if (lastName == nil) {
                    lastName = @"";
                }
                NSLog(@"%@",[NSString stringWithFormat:@"%@%@",lastName,firstName]);
            }
        }
    }
}

@end