//
//  Person.m
//  006_property&id&init&类工厂方法
//
//  Created by LJY on 2017/12/14.
//  Copyright © 2017年 LJY. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize age=_age;

-(NSString *)description{
    return [NSString stringWithFormat:@"name_%@,age_%i,height_%.2f,weight_%.1f",_name,_age,_height,_weight];
}

/*
//1.init
-(instancetype)init{
    //1.初始化父类
    self=[super init];
    //2.判断是否初始化成功
    if (self!=nil) {
        //3.初始化子类
        _name=@"ljy_init";
    }
    //4.返回当前对象地址
    return self;
}
 */
//2.init简化
-(instancetype)init{
    if (self=[super init]) {
        _name=@"ljy_init2";
    }
    return self;
}

-(instancetype)initWithName:(NSString *)name AndAge:(int)age{
    if (self=[super init]) {
        _name=name;
        _age=age;
    }
    return self;
}


+(instancetype)person{
    Person *p=[Person new];
    return p;
}

+(instancetype)personWithAge:(int)age{
    Person *p=[Person new];
    p.age=age;
    return p;
}

@end
