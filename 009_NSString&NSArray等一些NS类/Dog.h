//
//  Dog.h
//  009_NSString&NSArray等一些NS类
//
//  Created by LJY on 2018/1/30.
//  Copyright © 2018年 LJY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject{
    int _age;
}

@property int age;

-(void) say;

-(void) sayWithName:(NSString *)name;

-(instancetype)initWithAge:(int)age;

+(instancetype)dogWithAge:(int)age;


@end
