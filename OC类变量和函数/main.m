//
//  main.m
//  demo002
//
//  Created by LJY on 2017/12/12.
//  Copyright © 2017年 LJY. All rights reserved.
//

#import <Foundation/Foundation.h>

//类的声明
@interface Iphone:NSObject{
    //设为公共
    @public
    //属性，成员变量（存储在堆中，不会自动释放，只能程序员手动释放）
    double _model;
    int _cpu;
    float _size;
}
//行为声明:（）数据类型,参数前加：，无参数直接分号
//-对象方法
-(void) aboudIphone;
//+类方法
+(int) sum:(int) num1 second:(int) num2;

@end

@implementation Iphone
//行为
//无参数，无返回值
-(void) aboudIphone{
    NSLog(@"aboudIphone:型号-%.1f,多核-%i,尺寸-%.1f",_model,_cpu,_size);
}
//多参数，有返回值
+(int) sum:(int) num1 second:(int) num2{
    return num1+num2;
}

@end

//  全局变量（存储在静态区中，程序一启动就会分配存储空间，直到程序结束才会释放）
int a,b=10;
//函数声明
void hello(char* name);

int main(int argc, const char * argv[]) {
    //创建对象
    Iphone *p=[Iphone new];
    //操作属性
    p->_model=4;
    p->_cpu=1;
    p->_size=3.5;
    //访问属性
    NSLog(@"Iphone:型号-%.1f,多核-%i,尺寸-%.1f",p->_model,p->_cpu,p->_size);
    //调用对象方法
    [p aboudIphone];
    //调用类方法
    int sumRes=[Iphone sum:3 second :4];
    NSLog(@"sumRes:%i",sumRes);
    
    //局部变量（存储在栈中，系统会自动释放）
    int c=22;
    //访问成员变量，全局变量，局部变量
    NSLog(@"p->_size:%.1f,b:%i,c:%i",p->_size,b,c);
    //访问函数
    hello("ljy");
    return 0;
}

//函数实现
void hello(char* name){
    printf("hello %s\n",name);
}


