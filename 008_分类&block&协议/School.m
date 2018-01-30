//
//  School.m
//  008_分类&block&协议
//
//  Created by LJY on 2018/1/9.
//  Copyright © 2018年 LJY. All rights reserved.
//

#import "School.h"

@implementation School

-(void)sport{
    NSLog(@"sport----");
    if ([_delegate respondsToSelector:@selector(palyBasketbal)]) {
        _delegate.palyBasketbal;
    }
    
}

@end
