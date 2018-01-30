//
//  Person.h
//  008_分类&block&协议
//
//  Created by LJY on 2018/1/9.
//  Copyright © 2018年 LJY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SportProtocol.h"

@interface Person : NSObject<SportProtocol>{
    NSString *_name;
}

+(instancetype)person;

-(instancetype)initWithName:(NSString *)name;

+(instancetype)personWithName:(NSString *)name;

@property(nonatomic,strong) NSString *info;

-(void) palyBasketbal;

@end
