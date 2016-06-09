//
//  ZZTextField_2.h
//  Demo
//
//  Created by 刘威振 on 6/7/16.
//  Copyright © 2016 LiuWeiZhen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Aspects.h"

typedef void (^block_id_t)(id obj);

@interface ZZTextField_2 : UITextField

@property (nonatomic, copy) block_id_t searchCallback;

@end
