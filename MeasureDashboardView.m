//
//  MeasureDashboardView.m
//  仪表盘
//
//  Created by 秦晓广 on 16/6/1.
//  Copyright © 2016年 秦晓广. All rights reserved.
//

#import "MeasureDashboardView.h"
//表盘支持的最小体温数值
static CGFloat MIN_VALUE = 34;
//表盘支持的最大体温数值
static CGFloat MAX_VALUE = 43;
@implementation MeasureDashboardView
- (void)drawRect:(CGRect)rect {
    //
    UIImage *imageBg = [UIImage imageNamed:@"bg_measure_dashboard"];
    [imageBg drawInRect:rect];
    
    UIImage *imageMask = [self getMeasureMaskImage:rect];
    [imageMask drawInRect:rect];
    
    int viewW = rect.size.width;
    int viewH = rect.size.height;
    //绘制文本
    int textW = 55;
    int textH = 25;
    
    int textX = (viewW-textW)*0.5;
    int textY = (viewH-textH)*0.5;
    
    NSString *valueStr = [NSString stringWithFormat:@"%.2f",self.value];
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:25],NSForegroundColorAttributeName:[UIColor blackColor]};
    [valueStr drawInRect:CGRectMake(textX, textY,textW,textH) withAttributes:dic];
}
-(UIImage *)getMeasureMaskImage:(CGRect) rect{
    //绘制表盘
    UIImage *imageDash = [UIImage imageNamed:@"bg_measure_dashboard_mask"];
    
    int viewW = rect.size.width;
    int viewH = rect.size.height;
    
    CGFloat centerX = viewW*1.0/2.0;
    CGFloat centerY = viewH*1.0/2.0;
    
    //裁剪图片，通过绘制扇形进行裁剪
    UIGraphicsBeginImageContextWithOptions(rect.size,NO,0);
    [[UIColor redColor]set];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2);
    CGContextMoveToPoint(context, centerX, centerY);
    float startAngle =[self getStartAngle];
    float endAngle = M_PI*5/2.0;
    CGContextAddArc(context, centerX, centerY, centerX,startAngle ,endAngle, 0);
    CGContextClosePath(context);
    CGContextClip(context);
    [imageDash drawInRect:rect];
    
    //获取裁剪后的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return newImage;
}
#pragma 获取裁剪图片的开始角度
-(CGFloat)getStartAngle{
    float currentValue = _value;
    if (currentValue<=MIN_VALUE) {
        currentValue = MIN_VALUE;
    }
    if (currentValue >= MAX_VALUE) {
        currentValue = MAX_VALUE;
    }
    //由于整个表盘被分成了9等份，所以每一份对应的角度是40度
    float angle = M_PI/2.0+M_PI*ABS(currentValue-MIN_VALUE)*(40.0/180.0);
    return angle;
}
-(void)setValue:(float)value{
    _value = value;
    [self setNeedsDisplay];
}

@end
