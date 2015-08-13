//
//  LXFGestureLock.h
//
//  Created by Xiaofeng Li  on 15/8/1.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import <UIKit/UIKit.h>
@class LXFGestureLock;

typedef enum : NSUInteger {
    kGestureLockInputStateValueRight,
    kGestureLockInputStateValueError,
    kGestureLockInputStateValueClear,
    kGestureLockInputStateValueNone,
} LXFGestureLockInputState;

@protocol LXFGestureLockDelegate <NSObject>

/**
 *  抬起时
 *
 *  @param headerView 手势锁view
 *  @param key        输入完毕的值
 *
 *  @return 后续的响应模式
 */
-(LXFGestureLockInputState)gestureLock:(LXFGestureLock*)headerView key:(NSString *)key;

@end

@interface LXFGestureLock : UIView
@property (nonatomic,weak) id<LXFGestureLockDelegate> delegate;
@property (nonatomic,strong) UIColor * lineColor;
@property (nonatomic,strong) UIColor * errorLineColor;
@property (nonatomic,strong,readonly) UIColor * currColor;
@end
