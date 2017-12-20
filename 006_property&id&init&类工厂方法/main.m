//
//  main.m
//  006_property&id&init&类工厂方法
//  Created by LJY on 2017/12/14.
//  Copyright © 2017年 LJY. All rights reserved.
//
//1.property:一个编译器方法
//(1)作用：
//  Xcode4.4之前
//      @property用代替setter/getter方法的声明，
//      @synthesize用来代替setter/getter方法的实现，如果@synthesize后面的名称没有赋值，则默认赋值给相同名称的成员变量
//  Xcode4.4之后
//      对@property进行了增强，可同时代替声明和实现
//(2)@property的一个弊端是，只是最简单的实现，并不能对传入的数据进行过滤
//(3)使用@property生成setter/getter时，可以用声明成员变量，系统会自动生成_开头的成员变量
//但是这个自动生成的成员变量是私有的，也就是在.m中生成的，而非在.h中生成
//(4)readonly只读，readwrite可读可写(默认)
//(5)setter/getter方法的别名
//
//2.id:
//可以调用子类特有的方法也可以调用私有方法
//id==NsObject *,万能指针，区别在于id是动态数据类型，而后者是静态数据类型
//特点是：编译时编译器并不知道变量的真实数据类型，只有在运行时才能知晓，
//并且如果通过动态数据类型定义变量，如果访问了不属于动态数据类型的属性方法，编译器不会报错
//弊端也正是上面这一行，导致运行时错误
//应用场景：多态，减少代码量
//
//3.init：初始化方法
//(1)必须先初始化父类，并判断父类是否初始化成功，若成功，再初始化子类
//(2)返回当前对象地址
//(3)new==alloc+init
//  new做了三件事：开辟存储空间(alloc)，初始化所有属性(init)，返回对象地址
//(4)自定义构造方法（自定义init方法）：
//  一定是对象方法，返回值类型为id或instancetype，方法名以init开头
//  一个类可以有0或多个自定义构造方法
//  需要在.h文件中声明
//
//4.类工厂方法：
//(1)用于快速创建对象的类方法，分配存储空间并初始化
//(2)规范：一定是类方法，方法名以类名开头，首字母小写，返回值类型为id或instancetype
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Coder.h"

int main(int argc, const char * argv[]) {
    //调用property生成的setter/getter方法
    Person *p1=[Person new];
    [p1 addAge:12];
    [p1 setName:@"ljy"];
    [p1 setHeight:1.75];
    [p1 setMarried:true];
    NSLog(@"married:%hhd",[p1 isMarried]);
    NSLog(@"p1:%@",p1);
    //id动态数据类型
    Coder *c=[Coder new];
    [c doCode];
//    Person *c1=[Coder new];
//    [c1 doCode];
//    NSObject *c2=[Coder new];
//    [c2 doCode];
    id c3=[Coder new];
    //判断指定对象的类型是否是某一个类，或其子类
    if([c3 isKindOfClass:[Coder class]]){
        [c3 doCode];
    }
    //判读指定对象是否某一个类的实例
    if([c3 isMemberOfClass:[Coder class]]){
        [c3 doCode];
    }
    //类方法，判断一个类是否是某个类的子类
    if([Coder isSubclassOfClass:[Person class]]){
        NSLog(@"Coder isSubclassOfClass Person");
    }
    //已经初始化了_name
    Person *p2=[Person new];
    NSLog(@"p2:%@",p2);
    //alloc+init==new
    Person *p3=[Person alloc];
    p3=[p3 init];
    NSLog(@"p3:%@",p3);
    Person *p4=[[Person alloc] init];
    NSLog(@"p4:%@",p4);
    //instancetype:将返回值赋值给其他类型会报警告
    NSString *p5=[[Person alloc] init];
    NSLog(@"p5:%@",p5);
    //自定义构造方法的调用
    Person *p6=[[Person alloc] initWithName:@"Mr.L" AndAge:18];
    NSLog(@"p6:%@",p6);
    //类工厂方法
    Person *p7=[Person person];
    NSLog(@"p7:%@",p7);
    Person *p8=[Person personWithAge:19];
    NSLog(@"p8:%@",p8);
    return 0;
}
