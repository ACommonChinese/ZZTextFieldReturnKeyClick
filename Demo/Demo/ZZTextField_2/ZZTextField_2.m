//
//  ZZTextField_2.m
//  Demo
//
//  Created by 刘威振 on 6/7/16.
//  Copyright © 2016 LiuWeiZhen. All rights reserved.
//

#import "ZZTextField_2.h"

@interface ZZTextField_2 () <UITextFieldDelegate>

@end

@implementation ZZTextField_2

- (void)setSearchCallback:(block_id_t)searchCallback {
    _searchCallback = searchCallback;
    
    self.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.searchCallback) {
        self.searchCallback(textField.text);
    }
    
    NSLog(@"ZZTextField_2(Category).textField_%@ called %s", @(textField.tag), __func__);
    return YES;
}

@end
