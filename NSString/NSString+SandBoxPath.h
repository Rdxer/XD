//
//  NSString+SandBoxPath.h
//
//  Created by Xiaofeng Li  on 15/8/15.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SandBoxPath)

/// 文档
-(instancetype)appendDocumentPath;
/// tmp
-(instancetype)appendTempPath;
/// 缓存
-(instancetype)appendCachePath;
/// 图片缓存
-(instancetype)appendImageCachePath;
@end
