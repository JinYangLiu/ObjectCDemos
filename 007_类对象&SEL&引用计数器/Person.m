//
//  Person.m
//  007_类对象&SEL&引用计数器
//
//  Created by LJY on 2017/12/21.
//  Copyright © 2017年 LJY. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (void)test {
    NSLog(@"test function");
}

+(void)load{
    NSLog(@"Person类被加载到内存");
}

+(void)initialize{
    NSLog(@"Person initialize方法调用");
}

-(void)log:(NSString *) info{
    NSLog(@"ljy---->%@",info);
}

-(void)driveCar:(id)car andSEL:(SEL)sel{
    [car performSelector:sel];
}

- (void)dealloc
{
    NSLog(@"dealloc...");
}

@end
