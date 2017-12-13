//
//  Soldier.m
//  多文件和匿名对象
//
//  Created by LJY on 2017/12/13.
//  Copyright © 2017年 LJY. All rights reserved.
//

#import "Soldier.h"

//士兵实现
@implementation Soldier{
    
}

-(void)fire:(id)gun{
    NSLog(@"soldier-%s:",_info._name);
    if(gun!=nil)
        [gun fire];
    else
        NSLog(@"还没有枪哦");
}

@end
