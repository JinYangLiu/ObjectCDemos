//
//  main.m
//  007_类对象&SEL&引用计数器
//
//  Created by LJY on 2017/12/21.
//  Copyright © 2017年 LJY. All rights reserved.
//
/*
 1.类的本质：类其实也是一个对象，该对象会在类第一次被使用时创建
    有了类对象就可以创建实例对象，实例对象中有一个isa指针指向创建自己的类对象
    类对象中保存了当前对象的所有对象方法，元类对象保存了类方法，根元类对象保存了NSObject的类方法如new
 2.类对象：见下面例子
 3.类加载：只要程序启动就会将所有类的代码加载到内存中，放到代码区
    load方法会在当前类被加载到内存时调用，有且仅会调用一次，先调用父类load，再调用子类load
 4.类使用：当前类第一次被使用时(创建类对象时)就会调用initialize方法，程序调用过程中只会调用一次
    用于对某一个类进行一次性的初始化，先调用父类的，再调用子类的
 5.SEL
    作用1：配合对象/类来检查有没有实现某一个对象/类方法
    作用2：配合对象/类来调用某个SEL方法
    作用2：配合对象将SEL类型作为方法的形参
 6.引用计数器
    对象被引用的次数，每个oc对象都有自己的引用对象
    系统根据引用计数器判断什么时候需要回收一个对象所占用的内存（为0时才会回收）
    使用alloc，new，copy等创建对象后，对象的引用计数器就是1
    操作：调用retain可使引用计数器+1；调用release可使引用计数器-1；调用retainCount可获得当前引用计数器的值
    注意：releas只是-1，并不代表回收/销毁了对象
    (会在程序编译时由编译器自动添加)
    (1)dealloc方法：
        对象销毁时调用，是对象的遗言；
        一般会重写该方法，释放相关资源，一旦重写dealloc方法就必须调用super dealloc，并且放在最后调用；
        注意：不能直接手动调用；一旦对象已经被回收，不可再次调用，否则崩溃（野指针错误）
        （野指针：对象被释放/回收则称为僵尸对象，指向一个僵尸对象的指针就称为野指针，给野指针发送消息会报错，
        为避免可将该指针=nil，因为给空指针发送消息不会报错）
 7.@property(nonatomic,retain) NSString *name;
 property的参数
 */

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"

void demo(Class c);

int main(int argc, const char * argv[]) {
    
    //实例对象
    Person *p1=[[Person alloc]init];
    Person *p2=[[Person alloc]init];
    //类对象
    Class c1=[p1 class];//创建方法1
    Class c2=[p2 class];
    Class c3=[Person class];//创建方法2
    //一个类在内存中只有一份类对象
    NSLog(@"c1=%p,c2=%p,c3=%p",c1,c2,c3);
    //类对象的应用场景
    Person *p3=[[c3 alloc]init];//1.用于创建实例对象
    p3.name=@"ljy";
    NSLog(@"p3.name=%@",p3.name);
    [c3 test];//2.用于调用类方法
    //3.多态
    demo(c3);
    demo([Car class]);//记得要加【】
    //SEL
    //作用1：
    [p1 setName:@"ljy"];
    SEL sel=@selector(setName:);
    SEL sel1=@selector(name);
    SEL sel2=@selector(setAge:);
    SEL sel3=@selector(log:);//有参数要加冒号
    BOOL b=[p1 respondsToSelector:sel];
    BOOL b1=[p1 respondsToSelector:sel1];
    BOOL b2=[p1 respondsToSelector:sel2];
    BOOL b3=[p1 respondsToSelector:sel3];
    NSLog(@"b=%i,b1=%i,b2=%i,b3=%i",b,b1,b2,b3);
    //作用2:(performSelector最多只能传递2个参数)
    [p1 performSelector:sel3 withObject:@"138123123123"];
    [p1 performSelector:sel withObject:@"Mr.J"];
    NSLog(@"p1.name=%@",p1.name);
    //作用3:
    Car *c=[Car new];
    SEL s=@selector(run);
    [p1 driveCar:c andSEL:s];
    //引用计数器：
    //[p1 release];
    //p1=nil;
    return 0;
}

//方法要声明
void demo(Class c){
    id obj=[[c alloc]init];
    NSLog(@"--->%@",obj);
}
