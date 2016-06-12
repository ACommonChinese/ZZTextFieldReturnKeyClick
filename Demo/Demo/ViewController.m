//
//  ViewController.m
//  Demo
//
//  Created by 刘威振 on 6/7/16.
//  Copyright © 2016 LiuWeiZhen. All rights reserved.
//
/**
 * 需求：
 * 1. 有 callback, 走 callback
 * 2. 如果也有 delegate，同样不影响调用
 */

#import "ViewController.h"
#import "ZZTextField.h"
#import "SecondViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField_1;
@property (weak, nonatomic) IBOutlet UITextField *textField_2;
@property (weak, nonatomic) IBOutlet ZZTextField *textField_3;
@property (weak, nonatomic) IBOutlet ZZTextField *textField_4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField_1.tag = 1;
    self.textField_1.delegate = self;
    self.textField_2.tag = 2;
    self.textField_2.delegate = self;
    
    self.textField_3.tag = 3;
    self.textField_3.searchCallback = ^(NSString *text) {
        NSLog(@"ZZTextField.textField_3#callback：%@", text);
    };
    
    self.textField_4.tag = 4;
    self.textField_4.searchCallback = ^(NSString *text) {
        NSLog(@"ZZTextField.textField_4#callback：%@", text);
    };
    self.textField_4.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"textField_%@ called %s", @(textField.tag), __func__);
    return YES;
}

- (IBAction)present:(id)sender {
    SecondViewController *controller = [[SecondViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
