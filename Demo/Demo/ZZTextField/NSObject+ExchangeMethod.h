//
//  NSObject+ExchangeMethod.h
//  Demo
//
//  Created by 刘威振 on 6/7/16.
//  Copyright © 2016 LiuWeiZhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ExchangeMethod)

+ (void)exchangeInstanceMethodWithClass:(id)klass method:(SEL)method otherClass:(id)klass2 otherMethod:(SEL)method2;
+ (void)exchangeInstanceMethod:(SEL)method otherMethod:(SEL)method2;

+ (void)exchangeClassMethodWithClass:(id)klass method:(SEL)method otherClass:(id)klass2 otherMethod:(SEL)method2;
+ (void)exchangeClassMethod:(SEL)method otherMethod:(SEL)method2;

@end
