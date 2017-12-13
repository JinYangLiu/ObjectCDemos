//
//  Gun.h
//  多文件和匿名对象
//
//  Created by LJY on 2017/12/13.
//  Copyright © 2017年 LJY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Clib.h"

//声明枪
@interface Gun:NSObject{
@public
    Clib *_clib;
}

//  射击并消耗子弹
-(void)fire;

@end
