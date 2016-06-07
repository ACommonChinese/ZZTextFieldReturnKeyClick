//
//  NSObject+ExchangeMethod.h
//  Demo
//
//  Created by 刘威振 on 6/7/16.
//  Copyright © 2016 LiuWeiZhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ExchangeMethod)

// 交换实例方法
+ (void)exchangeInstanceMethodWithClass1:(id)cls1 method1:(SEL)method1 class2:(id)cls2 method2:(SEL)method2;
+ (void)exchangeInstanceMethod1:(SEL)method1 method2:(SEL)method2;

// 交换类方法
+ (void)exchangeClassMethodWithClass1:(id)cls1 method1:(SEL)method1 class2:(id)cls2 method2:(SEL)method2;
+ (void)exchangeClassMethod1:(SEL)method1 method2:(SEL)method2;

@end
