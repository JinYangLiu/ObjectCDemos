//
//  Tools.m
//  009_NSString&NSArray等一些NS类
//
//  Created by LJY on 2018/3/1.
//  Copyright © 2018年 LJY. All rights reserved.
//

#import "Tools.h"

@implementation Tools
/*
 
+(instancetype)getInstance{
    Tools *instance=[[self alloc]init];
    return instance;
}

static Tools *_instance=nil;
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    //多线程会有问题
 
    NSLog(@"%s",__func__);
    由于所有的构造方法都会调用该方法，所以只需要在此方法中控制当前对象只创建一次即可
    if(_instance==nil){
        NSLog(@"创建了一个对象");
        _instance=[[super allocWithZone:zone]init];
    }
 
    //下面的可以保证在多线程也只创建一次
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance=[[super allocWithZone:zone]init];
    });
    return _instance;
}

-(id)copyWithZone:(NSZone *)zone{
    return _instance;
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}

*/

/*使用宏定义代替上面的单例实现*/
implementationSingleton(Tools);


@end
