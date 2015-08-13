//
//  UIBarButtonItem+LXF.h
//
//  Created by Xiaofeng Li  on 15/8/6.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LXF)

-(instancetype)initWithImage:(UIImage *)image imageForHighlighted:(UIImage *) imageH target:(id)target action:(SEL)action title:(NSString *)title;
@end
