//
//  SkinTool.h
//
//
//  Created by lxf  on 15/7/12.
//  Copyright (c) 2015年 lxf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SkinTool : NSObject

/// 加载当前皮肤样式下的素材
///
/// @param imageName 图片名
///
/// @return 加载的图片
+ (UIImage *)loadImage:(NSString *)imageName;

/// 供设置界面用得  保存最新的皮肤样式
+ (void)saveSkin:(NSString *)skin;

/// 根据当前的皮肤样式  以及  key  获取对应的颜色
///
/// @param key 控件的某个属性的(text  bg title)名称  two_label_text
///
/// @return 加载的颜色
+ (UIColor *)loadColor:(NSString *)key;

@end
