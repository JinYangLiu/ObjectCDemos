//
//  Dog.m
//  009_NSString&NSArray等一些NS类
//
//  Created by LJY on 2018/1/30.
//  Copyright © 2018年 LJY. All rights reserved.
//

#import "Dog.h"

@implementation Dog

-(void) say{
    NSLog(@"dog say...,age=%i",_age);
}

-(void) sayWithName:(NSString *)name{
     NSLog(@"dog_%@ say...",name);
}

-(instancetype)initWithAge:(int)age{
    if (self=[super init]) {
        _age=age;
    }
    return self;
}

+(instancetype)dogWithAge:(int)age{
    return [[self alloc]initWithAge:age];
}

@end
