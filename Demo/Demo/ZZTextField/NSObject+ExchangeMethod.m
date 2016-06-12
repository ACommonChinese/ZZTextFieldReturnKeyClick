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

+ (void)exchangeInstanceMethodWithClass:(id)klass method:(SEL)method otherClass:(id)klass2 otherMethod:(SEL)method2 {
    method_exchangeImplementations(class_getInstanceMethod(klass, method), class_getInstanceMethod(klass2, method2));
}

+ (void)exchangeInstanceMethod:(SEL)method otherMethod:(SEL)method2 {
    [self exchangeInstanceMethodWithClass:self method:method otherClass:self otherMethod:method2];
}

+ (void)exchangeClassMethodWithClass:(id)kass method:(SEL)method otherClass:(id)klass2 otherMethod:(SEL)method2 {
    method_exchangeImplementations(class_getClassMethod(kass, method), class_getClassMethod(klass2, method2));
}

+ (void)exchangeClassMethod:(SEL)method otherMethod:(SEL)method2 {
    [self exchangeClassMethodWithClass:self method:method otherClass:self otherMethod:method2];
}

@end
