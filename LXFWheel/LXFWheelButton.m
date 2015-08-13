//
//  LXFWheelButton.m
//  转盘
//
//  Created by Xiaofeng Li  on 15/8/9.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import "LXFWheelButton.h"

@implementation LXFWheelButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat btnW=40;
    CGFloat btnH=47;
    CGFloat btnX=(contentRect.size.width-btnW)  /2;
    CGFloat btnY=20;
    return  CGRectMake(btnX, btnY, btnW, btnH);
    
}
-(void)setHighlighted:(BOOL)highlighted
{

}

@end
