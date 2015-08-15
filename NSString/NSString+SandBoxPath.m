//
//  NSString+SandBoxPath.m
//
//  Created by Xiaofeng Li  on 15/8/15.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import "NSString+SandBoxPath.h"

@implementation NSString (SandBoxPath)

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
-(instancetype)appendImageCachePath
{
    NSString *dir=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    
    dir=[dir stringByAppendingPathComponent:@"imageCache"];
    
    return  [dir stringByAppendingPathComponent:self.lastPathComponent];
}
-(instancetype)appendTempPath
{
    return [NSTemporaryDirectory() stringByAppendingPathComponent:self.lastPathComponent];
}

@end
