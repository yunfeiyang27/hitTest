//
//  LHHWindow.m
//  模仿系统实现hitTest
//
//  Created by leihuan on 16/7/10.
//  Copyright © 2016年 leihuan. All rights reserved.
//

#import "LHHWindow.h"

@implementation LHHWindow

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    // 如果不能接收触摸事件（父控件选择了不允许用户交互、选择了被隐藏、透明度小于等于0.01），直接返回nil
    if (self.userInteractionEnabled == NO || self.hidden == YES || self.alpha < 0.1 ) {
        
        return nil;
    }

    // 如果触摸点不在自己身上（子控件超出了父视图的有效范围），直接返回nil
    if (![self pointInside:point withEvent:event]) {
        
        return  nil;
    }

    int count = (int)self.subviews.count;
    
    // 从后往前遍历子控件，如果子控件能接收到触摸事件，并且触摸点在子控件上，则找到了合适的view来接收事件，返回这个子控件；否则返回self
    for (int i = count - 1; i >= 0; i--) {
        
        UIView *chieldView = self.subviews[i];

        // 将触摸点的坐标系从self转换到子控件上
        CGPoint pointConvertToChieldView = [self convertPoint:point toView:chieldView];
        
        // 判断子控件是否能接收到触摸事件
        UIView *view = [chieldView hitTest:pointConvertToChieldView withEvent:event];
        
        if (view) {
            
            return view;
        }
  
    }
        return self;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%s",__func__);
    
}




@end
