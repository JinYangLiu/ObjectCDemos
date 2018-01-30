//
//  main.m
//  NSString&NSArray等一些NS类
//
//  Created by LJY on 2018/1/9.
//  Copyright © 2018年 LJY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

int main(int argc, const char * argv[]) {
    
     //-------- NSString ---------
    // 1.NSString:（不同平台，不同编译器存储方式不一样）
     //a.通过字符串常量创建，存储在常量区中，若多个字符串常量创建的内容一致，
     //则这多个对象指向同一块存储空间
    NSString *str1=@"ljy";
    NSString *str2=@"ljy";
    NSLog(@"str1=%p,str2=%p",str1,str2);
    //b.通过alloc init创建，只要调用alloc就会在堆内存中开辟一块存储空间
    NSString *str3=[[NSString alloc]initWithFormat:@"ljy"];
    NSString *str4=[[NSString alloc]initWithFormat:@"ljy"];
    NSLog(@"str3=%p,str4=%p",str3,str4);
    //c.通过类工厂方法创建
    NSString *str5=[NSString stringWithFormat:@"ljy"];
    NSString *str6=[NSString stringWithFormat:@"ljy"];;
    NSLog(@"str5=%p,str6=%p",str5,str6);
    //d.字符串文件读
    NSString *path=@"/Users/ljy/XcodeProjects/ObjectCDemos/009_NSString\&NSArray等一些NS类/test.txt";
    NSError *error=nil;
    NSString *str=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    if (error==nil) {
        NSLog(@"str=%@",str);
    }else{
        NSLog(@"error=%@",[error localizedDescription]);
    }
    
    //e.字符串文件写
   
    NSString *strWrite=@"渡佛成魔";
    NSString *path2=@"/Users/ljy/XcodeProjects/ObjectCDemos/test文件夹/writeTest.txt";
    BOOL flag=[strWrite writeToFile:path2 atomically:YES encoding:NSUTF8StringEncoding error:nil];
    //atomically:写入文件如果没有写完，yes则不会生成文件，no则生成
    NSLog(@"flag = %i",flag);
    
    //f.读取url
    NSString *path3=@"file://192.168.100.111/Users/ljy/XcodeProjects/ObjectCDemos/writeTest.txt";
    NSURL *url=[NSURL URLWithString:path3];
    NSString *readFromUrlFile=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"readFromUrlFile= %@",readFromUrlFile);
    //fileURLWithPath:自动传入file://
    NSURL *url2=[NSURL fileURLWithPath:path];
    NSString *readFromUrlFile2=[NSString stringWithContentsOfURL:url2 encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"readFromUrlFile2= %@",readFromUrlFile2);
    //中文
    NSString *path4=@"file://192.168.100.111/Users/ljy/XcodeProjects/ObjectCDemos/test文件夹/writeTest.txt";
    //url中包含中文时：
    path4=[path4 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url4=[NSURL URLWithString:path4];
    NSString *readFromUrlFile4=[NSString stringWithContentsOfURL:url4 encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"readFromUrlFile4= %@",readFromUrlFile4);
    //g.写入url
    NSString *abc=@"abcdefg";
    NSString *path5=@"/Users/ljy/XcodeProjects/ObjectCDemos/009_NSString\&NSArray等一些NS类/test2.txt";
    NSURL *url5=[NSURL fileURLWithPath:path5];
    BOOL flag5=[abc writeToURL:url5 atomically:YES encoding:NSUTF8StringEncoding error:nil];
     NSLog(@"flag5 = %i",flag5);
    //h.字符串比较
    NSString *str001=@"ABC";
    NSString *str002=@"abb";
    switch ([str001 compare:str002]) {
        case NSOrderedAscending:
            NSLog(@"str001 < str002");
            break;
        case NSOrderedSame:
            NSLog(@"str001 = str002");
            break;
        case NSOrderedDescending:
            NSLog(@"str001 > str002");
            break;
        default:
            break;
    }
    //忽略大小写比较
    switch ([str001 caseInsensitiveCompare:str002]) {
        case NSOrderedAscending:
            NSLog(@"str001 < str002");
            break;
        case NSOrderedSame:
            NSLog(@"str001 = str002");
            break;
        case NSOrderedDescending:
            NSLog(@"str001 > str002");
            break;
        default:
            break;
    }
    
    //i.判断开头
    NSString *str003=@"http://www.anxin.com/img/ljy.gif";
    if ([str003 hasPrefix:@"http://"]) {
        NSLog(@"str003是一个url");
    }else{
        NSLog(@"str003~~不~~是一个url");
    }
    //j.判断结尾
    if ([str003 hasSuffix:@".gif"]) {
        NSLog(@"str003是一个动图");
    }else{
         NSLog(@"str003~~不~~是一个动图");
    }
    //k.是否包含
    NSString *ax=@"anxin";
    NSRange range=[str003 rangeOfString:ax];
    NSLog(@"location=%lu, length=%lu",range.location,range.length);
    if (range.location==NSNotFound) {
        NSLog(@"str003中~~不~~包含 anxin");
    }else{
         NSLog(@"str003中包含 anxin");
    }
    //l.字符串截取
    NSRange subRange=NSMakeRange(7,13);
    NSString *subStr=[str003 substringWithRange:subRange];
    NSLog(@"subStr:%@",subStr);
    NSString *subStr2=[str003 substringFromIndex:20];
    NSLog(@"subStr2:%@",subStr2);
    NSString *subStr3=[str003 substringToIndex:7];
    NSLog(@"subStr3:%@",subStr3);
    //m.字符串替换
    NSString *replayStr=[str003 stringByReplacingOccurrencesOfString:@"anxin" withString:@"baidu"];
    NSLog(@"replayStr:%@",replayStr);
    //替换首位空格
    NSString *str004=@"AAAA   abcDEF   ";
    NSCharacterSet *set= [NSCharacterSet whitespaceCharacterSet];
    NSString *newStr004= [str004 stringByTrimmingCharactersInSet:set];
    NSLog(@"str004:-%@-",str004);
    NSLog(@"newStr004:-%@-",newStr004);
    //去除首尾大写字母
    NSString *str005=@"AAAA   abcDEF";
    NSCharacterSet *set2= [NSCharacterSet uppercaseLetterCharacterSet];
    NSString *newStr005= [str005 stringByTrimmingCharactersInSet:set2];
    NSLog(@"str005:-%@-",newStr005);
    //判断是否绝对路径
    //NSString *abPath=path;
    NSString *abPath=@"./test.txt";
    if ([abPath isAbsolutePath]) {
        NSLog(@"是绝对路径");
    }else{
        NSLog(@"～～不～～是绝对路径");
    }
    //获取文件路径的最后一个目录
    NSString *lastPath=[path lastPathComponent];
    NSLog(@"lastPath:%@",lastPath);
    //删除文件路径的最后一个目录
    NSString *newPath=[path stringByDeletingLastPathComponent];
    NSLog(@"newPath:%@",newPath);
    NSString *new2Path=[newPath stringByAppendingPathComponent:@"abc.txt"];
    NSLog(@"new2Path:%@",new2Path);
    //获取文件的扩展名
    NSString *endStr=[path pathExtension];
    NSLog(@"endStr:%@",endStr);
    //删除文件扩展名
    NSString *delEndStr=[path stringByDeletingPathExtension];
    NSLog(@"delEndStr:%@",delEndStr);
    //添加文件扩展名
    NSString *addEndStr=[delEndStr stringByAppendingPathExtension:@"png"];
    NSLog(@"addEndStr:%@",addEndStr);
    //字符串转大小写
    NSString *s001=@"123abcDEF呵呵";
    NSLog(@"s001:%@",s001);
    //大
    NSString *s001Up= [s001 uppercaseString];
    NSLog(@"s001Up:%@",s001Up);
    //小
    NSString *s001Lower= [s001 lowercaseString];
    NSLog(@"s001Lower:%@",s001Lower);
    //首字母转大写
    NSString *s001FirstUp= [s001 capitalizedString];
     NSLog(@"s001FirstUp:%@",s001FirstUp);
    //字符串与基本数据类型的转换
    NSString *str110=@"110";
    int num110=[str110 intValue];
    NSLog(@"110*2=%i",num110*2);
    //c语言字符串与oc字符串之间的转换：
    char *cStr="ljy";
    NSString *c2ocStr=[NSString stringWithUTF8String:cStr];
    NSLog(@"c2ocStr:%@",c2ocStr);
    NSString *ocStr=@"jyl";
    const char *oc2cStr=[ocStr UTF8String];
    NSLog(@"oc2cStr:%s",oc2cStr);
    
    //-------- NSMutableString ---------
    //可变长字符串，类似java的stringBuffer
    NSMutableString *mutableStr=[NSMutableString string];
    NSLog(@"刚创建：%@",mutableStr);
    //添加
    [mutableStr appendString:@"abcdefg"];
    NSLog(@"添加后：%@",mutableStr);
    //删除：
    NSRange mutableRange=[mutableStr rangeOfString:@"bc"];
    [mutableStr deleteCharactersInRange:mutableRange];
    NSLog(@"删除后：%@",mutableStr);
    //替换
    NSRange mutableRange2=[mutableStr rangeOfString:@"de"];
    [mutableStr replaceCharactersInRange:mutableRange2 withString:@"DE"];
    NSLog(@"替换后：%@",mutableStr);
    //插入
    NSRange mutableRange3=[mutableStr rangeOfString:@"f"];
    [mutableStr insertString:@"哈哈" atIndex:mutableRange3.location];
     NSLog(@"插入后：%@",mutableStr);
    
    
    //-------- NSArray ---------
    //c语言数组的弊端：只能存放一种数据类型；长度固定，不能很方便的添加/删除数组
    int arr1[4]={1,2,3,4};
    //oc中的数组：
    //1. 只能存放任意oc对象，并且是有序的
    //2. 不能存储非oc对象，如int/float/double/char/enum/struct等
    //3. 不可变，创建后不能删除或添加元素
//    NSArray *array=[[NSArray alloc]init];
//    NSArray *array=[NSArray arrayWithObject:@"123"];
    NSArray *array=[NSArray arrayWithObjects:@"111",@"222",@"333",@"444",[NSObject new], nil];
    NSLog(@"array=%@",array);
    NSLog(@"array.count:%lu",array.count);
    NSLog(@"array.firstObject:%@",array.firstObject);
    NSLog(@"array.lastObject:%@",[array lastObject]);
    NSLog(@"array[3]=%@",[array objectAtIndex:3]);
    NSLog(@"array[4]=%@",array[4]);//获取数组元素简写
    //数组简写
    NSArray *array2=@[@"aaa",@"bbb",@"ccc"];
    //是否包含某个元素
    if ([array containsObject:@"111"]) {
        NSLog(@"array 包含 111");
    }else{
        NSLog(@"array ~~bu~~包含 111");
    }
    
    if ([array2 containsObject:@"111"]) {
        NSLog(@"array2 包含 111");
    }else{
        NSLog(@"array2 ~~bu~~包含 111");
    }
    //遍历数组(三种方式)
    //for i
    for (int i=0; i<array.count; i++) {
        NSLog(@"arr[%i]=%@",i,array[i]);
    }
    //for in
    for (NSObject *obj in array) {
        NSLog(@"obj=%@",obj);
    }
    //迭代器遍历
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
//        if (idx==3) {
//            *stop=YES;
//        }
        NSLog(@"obj=%@,idx=%lu",obj,idx);
    }];
    //让数组元素都执行指定方法：
    Dog *dog1=[Dog dogWithAge:3];
    Dog *dog2=[Dog dogWithAge:1];
    Dog *dog3=[Dog dogWithAge:6];
    Dog *dog4=[Dog dogWithAge:2];
    NSArray *arrDog=@[dog1,dog2,dog3,dog4];
    [arrDog makeObjectsPerformSelector:@selector(say)];
    [arrDog makeObjectsPerformSelector:@selector(sayWithName:) withObject:@"哈士奇"];
    //排序：
    NSArray *arrNum=@[@10,@20,@9,@4];
    NSArray *sortArrNum=[arrNum sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"排序后：%@",sortArrNum);
    NSArray *sortDogs=[arrDog sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(Dog *dog1,Dog *dog2){
        return dog1.age>dog2.age;
    }];
    NSLog(@"排序后：%@",sortDogs);
    [sortDogs makeObjectsPerformSelector:@selector(say)];
    //数组拼接字符串
    NSMutableString *ms=[NSMutableString string];
    for (NSString *str in array2) {
        [ms appendString:str];
        [ms appendString:@"-"];
    }
    [ms deleteCharactersInRange:NSMakeRange(ms.length-1, 1)];
    NSLog(@"ms:%@",ms);
    //字符串切割成数组
    NSString *ss=@"a-b-c-d-e-f";
    NSArray *arrSs=[ss componentsSeparatedByString:@"-"];
    NSLog(@"arrSs=%@",arrSs);
    //数组写入到文件（只有数组元素为Foundation框架中的类中创建的对象才行，自定义的是不能写入成功的）
    NSString *pathArr=@"/Users/ljy/XcodeProjects/ObjectCDemos/009_NSString\&NSArray等一些NS类/testArr.plist";
    BOOL isSuccess=[arrSs writeToFile:pathArr atomically:YES];
    NSLog(@"isSuccess=%i",isSuccess);
    
    NSString *pathArr2=@"/Users/ljy/XcodeProjects/ObjectCDemos/009_NSString\&NSArray等一些NS类/testArr2.plist";
    BOOL isSuccess2=[sortDogs writeToFile:pathArr2 atomically:YES];
    NSLog(@"isSuccess2=%i",isSuccess2);
    
    return 0;
}
