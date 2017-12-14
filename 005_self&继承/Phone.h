//
//  Phone.h
//  006_继承
//
//  Created by LJY on 2017/12/13.
//  Copyright © 2017年 LJY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phone : NSObject{
    //实例变量修饰符（作用域：从出现开始到下一个修饰符结束，否则修饰所有实例变量）
    @public//可以在本类，子类，其他类中访问
    NSString *_name;
    int _size;
    @private//只可以在本类中访问，子类和其他类中都不能访问
    int _cpu;
    @protected//可以在本类及子类中访问，其他类中不能访问,默认情况下，所有实例变量都是protected
    int _id;
    @package//介于@public和@private之间，在同一包中访问就是public，在其他包访问就是private
    int _color;
    
}

-(void)setName:(NSString *)name;

-(void)setSize:(int)size;

-(NSString *)name;

-(int)size;

-(void)setPhoneInfo:(NSString*) name :(int) size;

-(NSString *)description;

@end
