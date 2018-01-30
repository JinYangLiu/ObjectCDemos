//
//  Person.m
//  008_分类&block&协议
//
//  Created by LJY on 2018/1/9.
//  Copyright © 2018年 LJY. All rights reserved.
//

#import "Person.h"

@interface Person(){
    int _age;
}

-(void)setAge:(int)age;

-(int)getAge;

@end

@implementation Person
/*
 //MRC
+(instancetype)person{
    return [[[self alloc]init]autorelease];
}

-(instancetype)initWithName:(NSString *)name{
    if (self=[super init]) {
        _name=name;
    }
    return self;
}

+(instancetype)personWithName:(NSString *)name{
    return [[[self alloc]initWithName:name]autorelease];
}
 */
//ARC
+(instancetype)person{
    return [[self alloc]init];
}

-(instancetype)initWithName:(NSString *)name{
    if (self=[super init]) {
        _name=name;
        //使用类扩展中的私有方法和私有属性
        [self setAge:12];
        NSLog(@"age:%i",self->_age);
    }
    return self;
}

+(instancetype)personWithName:(NSString *)name{
    return [[self alloc]initWithName:name];
}

-(void)setAge:(int)age{
    _age=age;
}

-(int)getAge{
    return _age;
}

-(void)palyBasketbal{
    NSLog(@"palyBasketbal");
}



@end
