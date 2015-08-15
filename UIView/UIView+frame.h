//
//  UIView+LXFOptionSize.h

//
//  Created by Xiaofeng Li  on 15/7/21.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (frame)
/**
 *  封装了对 view 的一些直接的操作
 */

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@end

