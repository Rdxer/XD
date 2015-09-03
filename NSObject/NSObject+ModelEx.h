//
//  ModelEx.h
//  wyxw
//
//  Created by Xiaofeng Li  on 15/9/2.
//  Copyright © 2015年 Xiaofeng Li . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(ModelEx)

/// 字典转模型
+(instancetype)objectWithDict:(NSDictionary *)dict;

#pragma mark - 属性列表

/**
 *  获取当前类的属性列表
 *
 *  @return 属性名称列表
 */
+(NSArray *)propertyList;

/**
 *  当前类型 + 所有父类的属性 NSObject 除外
 */
+(NSArray *)propertyAndSuperClassesList;
@end
