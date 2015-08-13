//
//  UIBarButtonItem+LXF.m
//
//  Created by Xiaofeng Li  on 15/8/6.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import "UIBarButtonItem+LXF.h"

@implementation UIBarButtonItem (LXF)
-(instancetype)initWithImage:(UIImage *)image imageForHighlighted:(UIImage *) imageH target:(id)target action:(SEL)action title:(NSString *)title
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    
    if(![title isEqualToString:@""] && title != nil)
        [button setTitle:title forState:UIControlStateNormal];
    
    if(image!=nil)
        [button setImage:image forState:UIControlStateNormal];
    
    if(imageH!=nil)
        [button setImage:imageH forState:UIControlStateHighlighted];
    
    [button sizeToFit];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [self initWithCustomView:button];
}
@end
