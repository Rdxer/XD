//
//  UIView+LXFShake.m
//  fengKuangCaiTu
//
//  Created by Xiaofeng Li  on 15/7/21.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import "UIView+LXFAnimater.h"

@implementation UIView (LXFAnimater)
/**
 *  晃动图片
 *
 */
-(void)shakeView
{
    CGFloat t =4.0;
    CGAffineTransform translateRight  =CGAffineTransformTranslate(CGAffineTransformIdentity, t,0.0);
    CGAffineTransform translateLeft =CGAffineTransformTranslate(CGAffineTransformIdentity,-t,0.0);
    
    self.transform = translateLeft;
    
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        self.transform = translateRight;
    } completion:^(BOOL finished){
        if(finished){
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.transform =CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}
@end
