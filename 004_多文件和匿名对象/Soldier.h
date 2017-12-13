//
//  Soldier.h
//  多文件和匿名对象
//
//  Created by LJY on 2017/12/13.
//  Copyright © 2017年 LJY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gun.h"

//用结构体表示一个人的信息
//typedef定义别名，方便调用
typedef struct {
    char *_name;
    double _height;
    double _weight;
}PersonInfo;

//声明士兵
@interface Soldier :NSObject{
@public
    //士兵信息
    PersonInfo _info;
    
}
//开枪方法
-(void)fire:(Gun *)gun;

@end
