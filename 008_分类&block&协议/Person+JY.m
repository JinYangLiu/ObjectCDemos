//
//  Person+JY.m
//  008_分类&block&协议
//
//  Created by LJY on 2018/1/9.
//  Copyright © 2018年 LJY. All rights reserved.
//

#import "Person+JY.h"

@implementation Person (JY)

-(void)hello:(NSString*)name{
    NSLog(@"(JY)%@:hello %@",_name,name);
}

+(void)test{
    NSLog(@"(JY)test");
}

@end
