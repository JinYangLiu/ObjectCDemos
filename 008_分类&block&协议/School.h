//
//  School.h
//  008_分类&block&协议
//
//  Created by LJY on 2018/1/9.
//  Copyright © 2018年 LJY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SportProtocol.h"

@interface School : NSObject

//代理设计模式
@property(nonatomic,strong)id<SportProtocol> delegate;

-(void)sport;

@end
