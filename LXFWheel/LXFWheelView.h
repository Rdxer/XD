//
//  LXFWheelView.h
//  转盘
//
//  Created by Xiaofeng Li  on 15/8/9.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXFWheelView : UIView
+(instancetype)wheel;
-(void)startRotating;
-(void)endRotating;
@end
