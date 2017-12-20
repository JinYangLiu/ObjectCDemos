//
//  main.m
//  006_self&继承
//  Created by LJY on 2017/12/13.
//  Copyright © 2017年 LJY. All rights reserved.
//
//1.self
//2.继承
//3.多态
//4.实例变量修饰符（详见Phone.h中）
//5.description(描述/说明，类似java的toString()方法)
//建议在description中尽量不用self获取变量，因为%@，self会造成死循环
//description有-，+两种方法，一般都是用-
//6.私有的成员变量：
//仅写在@implementation中的成员变量，在其他类中无法查看，也无法访问，只能在本类中访问
//而像@interface中被@private修饰的成员变量虽然不能直接操作，但是通过phone->_是可以查看到的
//7.Class 类对象
//

#import <Foundation/Foundation.h>
#import "HuaWeiPhone.h"
#import "SanXingPhone.h"

int main(int argc, const char * argv[]) {
    //继承和多态的体现
    Phone *phone1=[HuaWeiPhone new];
    [phone1 setPhoneInfo:@"HuaWei" :6];
    NSLog(@"phone1:%@",phone1);//phone中重写了description
    
    Phone *phone2=[SanXingPhone new];
    [phone2 setPhoneInfo:@"SanXing" :3];
    NSLog(@"phone2:%@",phone2);//phone中重写了description
    //打印Phone类对象
    Class c=[Phone class];
    NSLog(@"c:%@",c);
    return 0;
}
