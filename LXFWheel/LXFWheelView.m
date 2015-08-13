//
//  LXFWheelView.m
//  转盘
//
//  Created by Xiaofeng Li  on 15/8/9.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import "LXFWheelView.h"
#import "LXFWheelButton.h"

@interface LXFWheelView ()
@property (weak, nonatomic) IBOutlet UIButton *centerButton;
@property (weak, nonatomic) IBOutlet UIImageView *rotateView;
@property (nonatomic, weak) UIButton *selectButton;
@property (nonatomic, weak) CADisplayLink *link;
- (IBAction)clickChoose;
@end
@implementation LXFWheelView
+(instancetype)wheel
{
    return [[[NSBundle mainBundle]loadNibNamed:@"LXFWheel" owner:nil options:nil]lastObject];
}
-(void)awakeFromNib
{
    self.rotateView.userInteractionEnabled=YES;
    int count=(int)12;
    // 获取大图
    UIImage *imageBig=[UIImage imageNamed:@"LuckyAstrology"];
    UIImage *imageBigSelect=[UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    // 截取图片的宽高
    CGFloat scale=[UIScreen mainScreen].scale; // 缩放
    CGFloat h=imageBig.size.height * scale;
    CGFloat w=imageBig.size.width / count * scale;
    
    for (int index=0; index<count; index++) {
        // 创建摁钮
        LXFWheelButton *button=[LXFWheelButton buttonWithType:UIButtonTypeCustom];
        
        // 设置选定的背景图片
        [button setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        // 设置图片, 图片分为选定时候的 和 非选定状态的
        CGFloat x=index * w;
        CGRect rect=CGRectMake(x , 0, w, h);
        
        // 截取按钮的图片并且设置(普通状态)
        CGImageRef imageNormal=CGImageCreateWithImageInRect(imageBig.CGImage, rect);
        [button setImage:[UIImage imageWithCGImage:imageNormal] forState:UIControlStateNormal];
        
        // 选择状态的
        CGImageRef imageSelect=CGImageCreateWithImageInRect(imageBigSelect.CGImage, rect);
        [button setImage:[UIImage imageWithCGImage:imageSelect] forState:UIControlStateSelected];
        
        
        // 大小
        button.bounds=CGRectMake(0, 0, 68, 143);
        // 设置位置和锚点
        button.layer.position=CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
        button.layer.anchorPoint=CGPointMake(0.5, 1);
        
        // 计算旋转的角度
        CGFloat angle=M_PI * 2 / count * index;
        button.transform=CGAffineTransformMakeRotation(angle);
        
        // 添加点击监听
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchDown];
        [self.rotateView addSubview:button];
    }
}

-(void)clickButton:(UIButton *)button
{
    self.selectButton.selected=NO;
    button.selected=YES;
    self.selectButton=button;
}

-(void)startRotating
{
    if (self.link)return;
    CADisplayLink *link=[CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.link=link;
}
-(void)update{
    self.rotateView.transform=CGAffineTransformRotate(self.rotateView.transform, M_PI/500);
}
-(void)endRotating
{
    [self.link invalidate];
    self.link=nil;
}
- (IBAction)clickChoose {
    [self endRotating];
    CABasicAnimation *an=[CABasicAnimation animation];
    an.keyPath=@"transform.rotation";
    an.toValue=@( 2 * M_PI * 3 );
    an.duration=1.5;
    an.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    an.delegate=self;
    [self.rotateView.layer addAnimation:an forKey:nil];
    self.userInteractionEnabled=NO;
    
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.userInteractionEnabled=YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startRotating];
    });
}
@end
