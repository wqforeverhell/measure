//
//  ViewController.m
//  仪表盘
//
//  Created by 秦晓广 on 16/6/1.
//  Copyright © 2016年 秦晓广. All rights reserved.
//

#import "ViewController.h"
#import "MeasureDashboardView.h"

@interface ViewController ()
@property(nonatomic,strong)MeasureDashboardView *measureView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.measureView = [[MeasureDashboardView alloc]init];
    self.measureView.frame = CGRectMake(100, 70, 220, 220);
    self.measureView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.measureView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }

@end
