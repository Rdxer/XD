//
//  UIView+LXF.m
//
//  Created by LXF on 15/10/9.
//  Copyright © 2015年 Xiaofeng Li . All rights reserved.
//

#import "UIView+LXF.h"

@implementation UIView (LXF)

- (UIImage *)toImage
{
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
