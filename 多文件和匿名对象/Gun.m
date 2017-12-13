//
//  Gun.m
//  多文件和匿名对象
//
//  Created by LJY on 2017/12/13.
//  Copyright © 2017年 LJY. All rights reserved.
//

#import "Gun.h"

//枪实现
@implementation Gun{
    
}
-(void)fire{
    if (_clib==nil) {
        NSLog(@"还没有弹夹哦");
        return;
    }
    if (_clib->_bulletNum>0) {
        _clib->_bulletNum--;
        NSLog(@"开了一枪，子弹剩余%i",_clib->_bulletNum);
    }else{
        NSLog(@"没有子弹了，赶紧更换弹夹哦");
    }
}

@end
