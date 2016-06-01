//
//  MeasureDashboardView.h
//  仪表盘
//
//  Created by 秦晓广 on 16/6/1.
//  Copyright © 2016年 秦晓广. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeasureDashboardView : UIView
@property(nonatomic,assign)float value;

-(UIImage *)getMeasureMaskImage:(CGRect) rect;

@end
