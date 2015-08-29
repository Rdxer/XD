//
//  NSString+LXF.h
//  WebDav 测试
//
//  Created by Xiaofeng Li  on 15/8/29.
//  Copyright © 2015年 Xiaofeng Li . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LXF)

#pragma mark - 路径操作

/// 文档
-(instancetype)appendDocumentPath;

/// tmp
-(instancetype)appendTempPath;

/// 缓存
-(instancetype)appendCachePath;

/// 添加后缀
-(instancetype)appendingPathExtension:(NSString *)extension;

/// toUrl
-(NSURL *)url;

/// to Url by file://  
-(NSURL *)urlOfFile;

/// to Url Protocol header
-(NSURL *)urlWithProtocolHeader:(NSString *)pHead;


#pragma mark - encode

/// 返回 utf8 编码的data
-(NSData *)dataByUTF8;

/// 返回 base64 编码的data
-(NSData *)dataByBase64;

/// 返回 base64 编码的 字符串
-(NSString *)base64;


#pragma mark - decode
/// 以 utf 8 的方式从 data 中读取字符串
+(instancetype)stringWithUTF8Data:(NSData *)data;

/// base64 string to default string
+(instancetype)stringWithBase64String:(NSString *)base64String;

/// base64 data to default string
+(instancetype)stringWithBase64Data:(NSData *)base64data;

@end
