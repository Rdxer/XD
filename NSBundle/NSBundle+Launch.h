//
//  NSBundle+LXFLaunch.h
//
//  Created by Xiaofeng Li  on 15/8/5.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, AppVersionComparisonResult) {
    /**
     *  第一次安装
     */
    AppVersionComparisonResultFirst,
    /**
     *  版本相同
     */
    AppVersionComparisonResultEqual,
    /**
     *  当前版本 > 沙盒版本
     */
    AppVersionComparisonResultUpSetup,
    /**
     *  当前版本 < 沙盒版本
     */
    AppVersionComparisonResultDownSetup,
};


@interface NSBundle (Launch)
/**
 *  当前 版本号
 */
+(NSString *)currentlyVersionID;
/**
 *  沙盒的版本号,如果为 nil 则为第一次安装
 */
+(NSString *)sandBoxVersionID;
/**
 *  将当前的版本号保存到沙盒中
 *
 *  @return 是否成功
 */
+(BOOL)saveCurrentlyToSandBox;
/**
 *  比较当前的版本和沙盒的版本
 *
 *  @return 
 */
+(AppVersionComparisonResult)comparVersionID;
//+()
@end
