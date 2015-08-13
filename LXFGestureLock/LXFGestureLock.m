//
//  LXFGestureLock.m
//  0801-手势解锁
//
//  Created by Xiaofeng Li  on 15/8/1.
//  Copyright (c) 2015年 Xiaofeng Li . All rights reserved.
//

#import "LXFGestureLock.h"
#import "LXFUtils.h"

@interface LXFGestureLock ()

@property (nonatomic,strong) NSMutableArray * selectButtonArray;
@property (nonatomic,assign) CGPoint currentPoint;
@end
@implementation LXFGestureLock

// 添加摁钮
-(void)awakeFromNib
{

    _selectButtonArray=[NSMutableArray array];
    _lineColor=_currColor=[UIColor greenColor];
    _errorLineColor=[UIColor redColor];
    
    UIButton * button;
    int count=9;
    for (int index=0; index<count; index++) {
        button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.tag=index;
        [button setBackgroundImage:[UIImage imageNamed:@"LXFGestureLock.bundle/gesture_node_normal.png"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"LXFGestureLock.bundle/gesture_node_highlighted.png"] forState:UIControlStateSelected];
        [button setBackgroundImage:[UIImage imageNamed:@"LXFGestureLock.bundle/gesture_node_highlighted.png"] forState:UIControlStateHighlighted];
        button.userInteractionEnabled=NO;
        [self addSubview:button];
    }
}
// 布局摁钮
-(void)layoutSubviews
{
    [super layoutSubviews];
    int colMAX=3;
    CGFloat btnW=71;
    CGFloat btnH=71;
    CGFloat margin=(self.size.width-colMAX*btnW)/4;
    int count=(int)self.subviews.count;
    for (int index=0; index<count; index++) {
        CGFloat btnX=( index % colMAX ) * (margin+btnW) + margin;
        CGFloat btnY=( index / colMAX ) * (margin+btnH) + margin;
        CGRect btnframe=CGRectMake(btnX, btnY, btnW, btnH);
        [self.subviews[index] setFrame:btnframe];
    }
    
}

- (void)reset
{
    // 全部取消选中
    [self.selectButtonArray makeObjectsPerformSelector:@selector(setSelected:) withObject:@NO];
    // 清空
    [self.selectButtonArray removeAllObjects];
    _currColor=_lineColor;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point=[[touches anyObject] locationInView:self];
    [self optionButton:point];
    self.currentPoint=point;
    _currColor=self.lineColor;
    [self reset];
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point=[[touches anyObject] locationInView:self];
    [self optionButton:point];
    self.currentPoint=point;
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSString * key=@"";

    int count=(int)self.selectButtonArray.count;
    for (int index=0; index<count; index++) {
        key= [key stringByAppendingFormat:@"%ld",[self.selectButtonArray[index] tag]];
    }
//    
//    NSLog(@"%@",key);
//
    
    if(count > 0 && [self.delegate respondsToSelector:@selector(gestureLock:key:)])
    {
        LXFGestureLockInputState state= [self.delegate gestureLock:self key:key];
        switch (state) {
            
            case kGestureLockInputStateValueClear:
                [self reset];
                break;
            case kGestureLockInputStateValueError:
                // 错误之后的执行
                [self shakeView];
                _currColor=self.errorLineColor;
                break;
            case kGestureLockInputStateValueRight:
                //
                break;
            default:;
            case kGestureLockInputStateValueNone://
                //
                break;
        }
    }
    
    self.currentPoint=CGPointZero;
    [self setNeedsDisplay];
    
}

-(void)optionButton:(CGPoint)point
{
    for (UIButton * btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, point)) {
            if (btn.selected==NO) {
                btn.selected=YES;
                [self.selectButtonArray addObject:btn];
            }
        }
    }
}

-(void)drawRect:(CGRect)rect
{
    if (self.selectButtonArray.count==0) {
        return;
    }
    UIBezierPath * path=[UIBezierPath bezierPath];
    int count=(int)self.selectButtonArray.count;
    for (int index=0; index<count; index++) {
        UIButton * btn=self.selectButtonArray[index];
        if (index==0) {
            [path moveToPoint:btn.center];
        }else
        {
            [path addLineToPoint:btn.center];
        }
    }
    if (!CGPointEqualToPoint(self.currentPoint,CGPointZero)) {
        [path addLineToPoint:self.currentPoint];
    }
    [ self.currColor set];
    path.lineWidth=6;
    [path stroke];
   
}

@end
