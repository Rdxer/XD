//
//  SkinTool.m
//
//
//  Created by 0426iOS on 15/7/12.
//  Copyright (c) 2015年 0426iOS. All rights reserved.
//

#import "SkinTool.h"

@interface SkinTool()

@end
static NSString *_skin;
@implementation SkinTool

/**
 *  类加载的时候 就会调用  调用一次
 */
+(void)initialize
{
    _skin = [[NSUserDefaults standardUserDefaults]objectForKey:@"skin1"];
    if (_skin == nil) {
        _skin = @"blue";
    }
}

/**
 *  类方法
 */
+ (void)saveSkin:(NSString *)skin
{
    _skin = skin;
    //保存
    [[NSUserDefaults standardUserDefaults]setObject:skin forKey:@"skin1"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}



+(UIImage *)loadImage:(NSString *)imageName
{
    NSString *pathName = [NSString stringWithFormat:@"skin/%@/%@",_skin,imageName];
    UIImage *image = [UIImage imageNamed:pathName];
    return image;
}


+(UIColor *)loadColor:(NSString *)key
{
    //拼接路静
    
    NSString *plistName = [NSString stringWithFormat:@"skin/%@/color.plist",_skin];
    NSString *path = [[NSBundle mainBundle]pathForResource:plistName ofType:nil];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    NSString *result = dict[key];
    
    NSArray *allColor = [result componentsSeparatedByString:@","];
    
    CGFloat r = [allColor[0] integerValue]/255.0;
    CGFloat g = [allColor[1] integerValue]/255.0;
    CGFloat b = [allColor[2] integerValue]/255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    
}


@end
