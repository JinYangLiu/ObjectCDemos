//
//  Clib.h
//  多文件和匿名对象
//
//  Created by LJY on 2017/12/13.
//  Copyright © 2017年 LJY. All rights reserved.
//

#import <Foundation/Foundation.h>

//声明弹夹
@interface Clib:NSObject{
    //@public
    int _bulletNum;//子弹数量
}

//setter
-(void)setBulletNum:(int)bulletNum;
//getter
-(int)bulletNum;

@end
