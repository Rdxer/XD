//
//  NSString+LXF.m
//  WebDav 测试
//
//  Created by Xiaofeng Li  on 15/8/29.
//  Copyright © 2015年 Xiaofeng Li . All rights reserved.
//

#import "NSString+LXF.h"

@implementation NSString (LXF)

-(instancetype)appendDocumentPath
{
    NSString *dir=    NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES).lastObject;
    return [dir stringByAppendingPathComponent:self.lastPathComponent];
}
-(instancetype)appendCachePath
{
    NSString *dir=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    return  [dir stringByAppendingPathComponent:self.lastPathComponent];
}
-(instancetype)appendTempPath
{
    return [NSTemporaryDirectory() stringByAppendingPathComponent:self.lastPathComponent];
}

-(instancetype)appendingPathExtension:(NSString *)extension
{
    return [self stringByAppendingPathExtension:extension];
}
-(NSURL *)url
{
    return [NSURL URLWithString:self];
}
-(NSURL *)urlOfFile
{
    return [self urlWithProtocolHeader:@"file://"];
}
-(NSURL *)urlWithProtocolHeader:(NSString *)pHead
{
    // 拼接协议头,to url
    NSString *urlString = [pHead stringByAppendingString: self];
    NSURL *url= urlString.url;
    if (url) { // 转化成功
        return url;
    }
    // 转化失败 尝试进行 % 转义
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return urlString.url;
}
#pragma mark - 编码操作
-(NSData *)dataByUTF8
{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}
/// 返回 base64 编码的data
-(NSData *)dataByBase64
{
    return [[self dataByUTF8]base64EncodedDataWithOptions:0];
}
/// 返回 base64 编码的 字符串
-(NSString *)base64{
    return [NSString  stringWithUTF8Data:[self dataByBase64]];
}

/// utf 8 的方式从 data 中读取字符串
+(instancetype)stringWithUTF8Data:(NSData *)data
{
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}
/// base64 string to default string
+(instancetype)stringWithBase64String:(NSString *)base64String
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:base64String options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}
/// base64 data to default string
+(instancetype)stringWithBase64Data:(NSData *)base64data
{
    NSData *data = [[NSData alloc]initWithBase64EncodedData:base64data options:0];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

@end
