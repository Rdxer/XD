
//
//  ModelEx.m
//  wyxw
//
//  Created by Xiaofeng Li  on 15/9/2.
//  Copyright © 2015年 Xiaofeng Li . All rights reserved.
//

#import "NSObject+ModelEx.h"
#import <objc/runtime.h>


@implementation NSObject(ModelEx)

/// 字典转模型 使用的是加载当前类的属性列表来 进行 kvc
+(instancetype)objectWithDict:(NSDictionary *)dict
{
    id object = [[self alloc]init];
    NSArray *keyArray = [self propertyList];
    for (NSString *key in keyArray) {
        if (dict[key] != nil) {
            [object setValue:dict[key] forKey:key];
        }
    }
    return object;
}

#pragma mark - 属性列表的操作
static NSString *propertyListKey = @"propertyListKey";

// 获取当前类的 属性列表
+(NSArray *)propertyList
{
    NSArray *propertyList = objc_getAssociatedObject(self, (__bridge const void *)(propertyListKey));
    if (propertyList != nil){
        return propertyList;
    }
    
    // 需要进行加载
    unsigned int count ;
    objc_property_t *property = class_copyPropertyList(self, &count);
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:count];
    
    // 遍历获取 属性的名称
    for (int i = 0; i < count; ++i) {
        [arrayM addObject: [NSString stringWithUTF8String: property_getName(property[i])]];
    }
    // 使用完之后释放资源
    free(property);
    
    // 设置到关联对象
    objc_setAssociatedObject(self, (__bridge const void *)(propertyListKey), arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    return objc_getAssociatedObject(self, (__bridge const void *)(propertyListKey));
}

+ (NSArray *)propertyAndSuperClassesList
{
    if (self == [NSObject class]) {
        return [NSArray array];
    }
    // 先添加自己的
    NSMutableArray *arrayM = [NSMutableArray arrayWithArray:[self propertyList]];
    // 再添加父类的
    [arrayM addObjectsFromArray:[[self superclass] propertyAndSuperClassesList]];
    // 返回不可变数组
    return arrayM.copy;
}

@end
