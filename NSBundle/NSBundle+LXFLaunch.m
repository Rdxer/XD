//
//  NSBundle+LXFLaunch.m
//
//  Created by Xiaofeng Li  on 15/8/5.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import "NSBundle+LXFLaunch.h"



@implementation NSBundle (LXFLaunch)

// 获取当前的软件版本号
+(NSString *)currentlyVersionID
{
    return [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
}

// 获取沙盒的软件版本号
+(NSString *)sandBoxVersionID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   return [defaults objectForKey:@"_sandBoxVersion_"];
}

+(BOOL)saveCurrentlyToSandBox
{
    // 1,将其写到用户配置信息中
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    [userDefault setObject:[self currentlyVersionID]forKey:@"_sandBoxVersion_"];
    
    // 2,将修改的数据同步到沙盒文件中
    return [userDefault synchronize];
}

+(AppVersionComparisonResult)comparVersionID
{
    // 1,获取沙盒的版本 ID
    NSString *sanboxID=[self sandBoxVersionID];
    
    // 2,如果为 nil or @"" 则为第一次安装
    if (sanboxID==nil || [sanboxID isEqualToString:@""]) {
        return AppVersionComparisonResultFirst;
    }
    
    // 3,获取当前版本id
    NSString *currentlyID=[self currentlyVersionID];
    
    // 4,比较
    switch ([currentlyID compare:sanboxID]) {
        case NSOrderedSame:
            return AppVersionComparisonResultEqual;
        case NSOrderedAscending:
            return AppVersionComparisonResultDownSetup;
        case NSOrderedDescending:
            return AppVersionComparisonResultUpSetup;
        default:
            break;
    }

    return AppVersionComparisonResultFirst;
}
@end
