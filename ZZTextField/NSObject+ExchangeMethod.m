//
//  NSObject+ExchangeMethod.m
//  Demo
//
//  Created by 刘威振 on 6/7/16.
//  Copyright © 2016 LiuWeiZhen. All rights reserved.
//

#import "NSObject+ExchangeMethod.h"
#import <objc/runtime.h>

@implementation NSObject (ExchangeMethod)

+ (void)exchangeInstanceMethodWithClass1:(id)cls1 method1:(SEL)method1 class2:(id)cls2 method2:(SEL)method2
{
    method_exchangeImplementations(class_getInstanceMethod(cls1, method1), class_getInstanceMethod(cls2, method2));
}

+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2
{
    [self exchangeInstanceMethodWithClass1:self method1:method1 class2:self method2:method2];
    // method_exchangeImplementations(class_getInstanceMethod(self, method1), class_getInstanceMethod(self, method2));
}

+ (void)exchangeClassMethodWithClass1:(id)cls1 method1:(SEL)method1 class2:(id)cls2 method2:(SEL)method2
{
    method_exchangeImplementations(class_getClassMethod(cls1, method1), class_getClassMethod(cls2, method2));
}

+ (void)exchangeClassMethod1:(SEL)method1 method2:(SEL)method2
{
    [self exchangeClassMethodWithClass1:self method1:method1 class2:self method2:method2];
    // method_exchangeImplementations(class_getClassMethod(self, method1), class_getClassMethod(self, method2));
}

@end
