//
//  UIControl+FLExtension.h
//  FLExtension
//
//  Created by yangli on 15/8/11.
//  Copyright (c) 2015年 FL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (FLExtension)

/**
 *将块添加给某一特定事件
 */
- (void)fl_addEventHandler:(void (^)(id sender))handler forControlEvents:(UIControlEvents)controlEvents;

/**
 *移除特定事件组合的所有数据块.
 */
- (void)fl_removeEventHandlersForControlEvents:(UIControlEvents)controlEvents;

/** 
 *检查控件是否具有任何特定的事件块.
 */
- (BOOL)fl_hasEventHandlersForControlEvents:(UIControlEvents)controlEvents;

@end
