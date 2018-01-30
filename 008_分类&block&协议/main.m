//
//  main.m
//  分类&block&协议
//
//  Created by LJY on 2018/1/9.
//  Copyright © 2018年 LJY. All rights reserved.
/*
 1. @class:可以简单的引用一个类，如@class Person；，告诉编译器Person是一个类，并不会包含这个类的所有内容；一般在.h中使用@class引用某个类，在.m中使用#import引入该类的头文件，具体总结图例可以查看我的有道笔记http://note.youdao.com/noteshare?id=56e6920c2377a04a3281f818de6f940c中的截图；
 
 2. @自动释放池
 写法1:
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
 写法2:
     //创建
     NSAutoreleasePool *pllo=[[NsAutoreleasePool alloc]init];
     // insert code here...
     NSLog(@"Hello, World!");
     //销毁
     [pool release];
 MRC模式下，对于自定义的类，需要在类工厂方法中调用autorelease,具体可参看Person类
 
 3.MRC，ARC（内存的手动和自动管理，Xcode 4.1及其以前版本没有ARC，
 需要理解MRC，但实际使用时强推ARC。），相关property参数参考006
 
 4. 分类（category）：给某个类扩充方法，和类一样分为声明和实现两部分，只能添加方法，不能添加属性
    a.分类中的property只会生成setter/getter方法的声明，不会生成实现及私有成员变量
    b.方法的调用顺序：分类，本类，父类。。。
    c.如果多个分类中都有与原类中同名的方法，那么调用该方法的时候执行谁由编译器决定，会执行最后一个被编译的分类中的方法
    d.分类中可以访问原类.h中的属性
 5. 类扩展（extendsion）：是category的一个特例，可以为某个类扩充私有成员变量和私有方法
    写在原类的.m中，格式为 @interface 原类名() ... @end
    对比分类是少了分类名称，因此也称为匿名分类
 6.block：代码块，用于代码的重用，可以作为参数，变量，返回值等；
    可以有参数和返回值，应该算是个轻量级的函数;
    结合typedef的使用；
    可以访问block外面的变量，但是无法修改外面的变量,若想修改需要定义变量时添加__block
 7.protocol协议，声明一些方法，不写实现，类似java中的接口
    只要父类遵守了某个协议，则子类也遵守
    同java一样，oc也是单继承多实现的
    协议也可以遵守其他协议
    NSObject是每个协议都要遵守的基协议如：@protocol abc <NSObject> ... @end
    协议中有两个关键字可以控制方法是否不许要实现
        @required:默认的，必须实现，不实现会报警告
        @optional：不必须实现
    每次调用对象的协议方法时应该进行验证是否有实现 respondsToSelector
    应用场景：可用作范型
 
 
 
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+JY.h"
#import "School.h"

int sum(int num1,int num2);
int minus(int num1,int num2);

typedef int (*calculte) (int,int);
typedef int (^calculteBlock) (int,int);

int main(int argc, const char * argv[]) {
    //分类和类扩展
    Person *p=[[Person alloc]initWithName:@"ljy"];
    [p setInfo:@"coder"];
    NSLog(@"info:%@",[p info]);
    [Person test];
    [p hello:@"MR.L"];
    
    //block代码块
    void (^roseBlock)(int);
    
    roseBlock=^(int num){
        for (int i=0; i<num; i++) {
            NSLog(@"rose_%i",i);
        }
    };
    
    roseBlock(5);
    
    //typedef
    calculte s=sum;
    NSLog(@"1+2=%i",s(1,2));
    calculte m=minus;
    NSLog(@"3-2=%i",m(3,2));
    
    //block&typedef
    calculteBlock sumBlock=^(int num1,int num2){
        return num1+num2;
    };
    calculteBlock minusBlock=^(int num1,int num2){
        return num1-num2;
    };
    
    NSLog(@"block:1+2=%i",sumBlock(1,2));
    NSLog(@"block:3-2=%i",minusBlock(3,2));
    //访问外面的变量
    int n=10;
    void (^testBlock)()=^{
        //n++;//修改外部变量会报错
        NSLog(@"num=%i",n);
    };
    testBlock();
     NSLog(@"num=%i",n);
    //协议
    //1.判断是否实现了该方法
    if ([p respondsToSelector:@selector(palyBasketbal)]) {
       [p palyBasketbal];
    }
    //2.应用场景-范型:如下，若给P2赋值，则必须遵守SportProtocol协议
    Person<SportProtocol> *p2=[[Person alloc]init];
    School *sch=[[School alloc]init];
    [sch setDelegate:p2];
    [sch sport];
    
    
    
    return 0;
}



int sum(int num1,int num2){
    return num1+num2;
}

int minus(int num1,int num2){
    return num1-num2;
}
