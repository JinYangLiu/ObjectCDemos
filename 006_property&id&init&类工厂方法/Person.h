//
//  Person.h
//  006_property&id&init&类工厂方法
//
//  Created by LJY on 2017/12/14.
//  Copyright © 2017年 LJY. All rights reserved.
//

#import "Phone.h"

@interface Person : NSObject{
    int _age;
    NSString *_name;
}

@property(setter=addAge:) int age;

@property NSString *name;

@property(readwrite) float height;

@property(readonly) double weight;

@property(getter=isMarried) BOOL married;

-(NSString *)description;

-(instancetype)initWithName:(NSString *)name AndAge:(int)age;

+(instancetype)person;

+(instancetype)personWithAge:(int)age;

@end
