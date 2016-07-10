//
//  LHHViewController.m
//  模仿系统实现hitTest
//
//  Created by leihuan on 16/7/10.
//  Copyright © 2016年 leihuan. All rights reserved.
//

#import "LHHViewController.h"

@interface LHHViewController ()

@end

@implementation LHHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    
    redView.frame = CGRectMake(100, 100, 200, 200);
    
    [self.view addSubview:redView];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    NSLog(@"%s",__func__);
    
}

@end
