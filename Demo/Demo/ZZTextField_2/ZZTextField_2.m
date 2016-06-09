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

- (void)setDelegate:(id<UITextFieldDelegate>)delegate {
    [super setDelegate:delegate];
    
    __weak typeof(self) weakSelf = self;
    [[delegate class] aspect_hookSelector:@selector(textFieldShouldReturn:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info){

        if ([[info arguments][0] isKindOfClass:[ZZTextField_2 class]]) {
            ZZTextField_2 *textField = [info arguments][0];
            if (weakSelf.searchCallback) {
                weakSelf.searchCallback(textField.text);
            };
        }
    } error:NULL];
}

/**
 *  @bug: must first set delegate and then callback
 *
 *  @param newSuperview <#newSuperview description#>
 */
- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview && self.delegate == nil) {
        self.delegate = self;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

@end
