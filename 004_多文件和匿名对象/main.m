//
//  main.m
//  多文件和匿名对象
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
    clib->_bulletNum=8;
    Gun *gun=[Gun new];
    gun->_clib=clib;
    Soldier *soldier=[Soldier new];
    soldier->_info._name="Mr.L";
    [soldier fire:nil];
    NSArray *arr=@[@1,@2,@3,@4];
    for(id i in arr){
        [soldier fire:gun];
    }
    
    for(int i=0;i<3;i++){
        [soldier fire:gun];
    }
    clib->_bulletNum=8;
    gun->_clib=clib;
    [soldier fire:gun];
    //匿名对象
    NSLog(@"用匿名对象创建弹夹，但是没有给子弹赋值");
    gun->_clib=[Clib new];
    [soldier fire:gun];
    
    return 0;
}
