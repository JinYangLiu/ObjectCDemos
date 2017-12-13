//
//  main.m
//  多文件,匿名对象,setter&getter，自定义代码块创建setter/getter快捷方式,点语法（由编译器自动转化为setter或者getter方法）
//
//  Created by LJY on 2017/12/12.
//  Copyright © 2017年 LJY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Clib.h"
#import "Gun.h"
#import "Soldier.h"

int main(int argc, const char * argv[]) {
    NSLog(@"main start");
    Clib *clib=[Clib new];
//    clib->_bulletNum=8;
    //调用setter
    [clib setBulletNum:7];
    Gun *gun=[Gun new];
    gun->_clib=clib;
    Soldier *soldier=[Soldier new];
    soldier->_info._name="Mr.L";
    [soldier fire:nil];
    NSArray *arr=@[@1,@2,@3,@4];
    for(id i in arr){
        [soldier fire:gun];
    }
    
    for(int i=0;i<5;i++){
        [soldier fire:gun];
    }
//    clib->_bulletNum=8;
    //调用点语法
    clib.bulletNum=4;
    gun->_clib=clib;
    [soldier fire:gun];
    //匿名对象
    NSLog(@"用匿名对象创建弹夹，但是没有给子弹赋值");
    gun->_clib=[Clib new];
    [soldier fire:gun];
    
    return 0;
}
