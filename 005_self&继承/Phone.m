//
//  Phone.m
//  006_继承
//
//  Created by LJY on 2017/12/13.
//  Copyright © 2017年 LJY. All rights reserved.
//

#import "Phone.h"

@implementation Phone

-(void)setName:(NSString *)name{
    _name=name;
}

-(void)setSize:(int)size{
    _size=size;
}

-(NSString *)name{
    return _name;
}

-(int)size{
    return _size;
}

-(void)setPhoneInfo:(NSString*) name :(int) size{
    self.name=name;
    self.size=size;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"name_%@,size_%i",_name,_size];
}

@end
