//
//  NSObject+LXF.m
//  CaiPiao
//
//  Created by Xiaofeng Li  on 15/8/4.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import "NSObject+LXF.h"

@implementation NSObject (LXF)
+(NSString *)className
{
    return NSStringFromClass(self);
}
-(NSString *)className
{
    return [[self class]className];
}
@end
