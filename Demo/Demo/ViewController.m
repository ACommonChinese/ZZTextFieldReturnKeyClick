//
//  ViewController.m
//  Demo
//
//  Created by 刘威振 on 6/7/16.
//  Copyright © 2016 LiuWeiZhen. All rights reserved.
//
/**
 * 需求：如果设置代理，不影响代理方法的调用，同时如果有callback, 走callback
   如果不设置代理，有callback, 走callback
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
    
    self.textField_1.delegate = self;
    self.textField_2.delegate = self;

    self.textField_4.delegate = self;
    // self.textField_3.delegate = self;
    self.textField_3.searchCallback = ^(NSString *text) {
        NSLog(@"3. callback返回输入内容：%@", text);
    };

    self.textField_4.searchCallback = ^(NSString *text) {
        NSLog(@"4. callback返回输入内容：%@", text);
    };
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%s--%@", __func__, textField.delegate);
    return YES;
}

- (IBAction)present:(id)sender
{
    SecondViewController *controller = [[SecondViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
