//
//  SecondViewController.m
//  Demo
//
//  Created by 刘威振 on 6/7/16.
//  Copyright © 2016 LiuWeiZhen. All rights reserved.
//

#import "SecondViewController.h"
#import "ZZTextField_2.h"

@interface SecondViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField_1;
@property (weak, nonatomic) IBOutlet UITextField *textField_2;
@property (weak, nonatomic) IBOutlet ZZTextField_2 *textField_3;
@property (weak, nonatomic) IBOutlet ZZTextField_2 *textField_4;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.textField_1.tag = 1;
    self.textField_1.delegate = self;
    self.textField_2.tag = 2;
    self.textField_2.delegate = self;
    
    self.textField_3.tag = 3;
    self.textField_3.searchCallback = ^(NSString *text) {
        NSLog(@"ZZTextField_2.textField_3#callback：%@", text);
    };
    
    self.textField_4.tag = 4;
    self.textField_4.searchCallback = ^(NSString *text) {
        NSLog(@"ZZTextField_2.textField_4#callback：%@", text);
    };
    self.textField_4.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"textField_%@ called %s", @(textField.tag), __func__);
    return YES;
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
