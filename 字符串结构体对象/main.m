//
// OC字符串的使用，结构体作为对象的属性，对象作为方法参数传递,#pragma mark的使用
//
//  Created by LJY on 2017/12/12.
//  Copyright © 2017年 LJY. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark 个人信息
//用结构体表示一个人的信息
//typedef定义别名，方便调用
typedef struct {
    char *name;
    double height;
    double weight;
}PersonInfo;

#pragma mark -
#pragma mark 弹夹
//表示弹夹
@interface Clib:NSObject{
    @public
    int _bulletNum;//子弹数量
}

@end

//弹夹实现
@implementation Clib{
    
}

@end

#pragma mark -
#pragma mark 枪
//表示枪
@interface Gun:NSObject{
    @public
    Clib *_clib;
}

//  射击并消耗子弹
-(void)fire;

@end

//枪实现
@implementation Gun{
    
}
-(void)fire{
    if (_clib->_bulletNum>0) {
        _clib->_bulletNum--;
        NSLog(@"开了一枪，子弹剩余%i",_clib->_bulletNum);
    }
}

@end

#pragma mark -
#pragma mark 士兵
//表示士兵
@interface Soldier :NSObject{
    @public
    //士兵信息
    PersonInfo _info;
    
}
//开枪方法
-(void)fire:(Gun *)gun;

@end

//士兵实现
@implementation Soldier{
    
}

-(void)fire:(id)gun{
    NSLog(@"soldier-%s:",_info.name);
    [gun fire];
}

@end

#pragma mark -
#pragma mark 程序入口
int main(int argc, const char * argv[]) {
    NSLog(@"main start");
    Clib *clib=[Clib new];
    clib->_bulletNum=10;
    Gun *gun=[Gun new];
    gun->_clib=clib;
    Soldier *soldier=[Soldier new];
    soldier->_info.name="ljy";
    NSArray *arr=@[@1,@2,@3,@4];
    for(id i in arr){
        [soldier fire:gun];
    }
    for(int i=0;i<3;i++){
        [soldier fire:gun];
    }
    return 0;
}
