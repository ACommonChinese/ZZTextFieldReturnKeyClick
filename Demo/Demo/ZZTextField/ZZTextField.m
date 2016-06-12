//
//  ZZTextField.m
//  Demo
//
//  Created by 刘威振 on 6/7/16.
//  Copyright © 2016 LiuWeiZhen. All rights reserved.
//

#import "ZZTextField.h"
#import <objc/runtime.h>
#import "NSObject+ExchangeMethod.h"

@interface UITextField (ReturnKeyClick) <UITextFieldDelegate>

- (BOOL)returnKeyClick:(UITextField *)textField;

@end

@implementation UITextField (ReturnKeyClick)

- (BOOL)returnKeyClick:(UITextField *)textField {
    if ([textField isKindOfClass:[ZZTextField class]]) {
        ZZTextField *myField = (ZZTextField *)textField;
        if (myField.searchCallback) {
            myField.searchCallback(textField.text);
        }
    }
    
    return [textField returnKeyClick:textField];
}

@end

@interface ZZTextField () <UITextFieldDelegate>

@property (nonatomic, assign) id<UITextFieldDelegate> keepDelegate;

@end

@implementation ZZTextField

- (void)setDelegate:(id<UITextFieldDelegate>)delegate {
    [super setDelegate:delegate];
    
    if ([self isKindOfClass:[ZZTextField class]] && delegate != self) {
        SEL selector = @selector(textFieldShouldReturn:);
        if ([delegate respondsToSelector:selector]) {
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                [ZZTextField exchangeInstanceMethodWithClass:[self.delegate class] method:selector otherClass:[self class] otherMethod:@selector(returnKeyClick:)];
            });
        }
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit {
    self.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.searchCallback) {
        self.searchCallback(textField.text);
    }
    
    return YES;
}

@end
