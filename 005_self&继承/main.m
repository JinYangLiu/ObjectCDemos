//
//  main.m
//  006_self&继承
//
//self,继承，多态，实例变量修饰符（详见Phone.h中），description(描述/说明，类似java的toString()方法)
//
//  Created by LJY on 2017/12/13.
//  Copyright © 2017年 LJY. All rights reserved.
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
    return 0;
}
