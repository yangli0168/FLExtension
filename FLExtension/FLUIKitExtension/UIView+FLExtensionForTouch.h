//
//  UIView+FLExtension.h
//  FLExtension
//
//  Created by yangli on 15/8/11.
//  Copyright (c) 2015年 FL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FLExtensionForTouch)

/**
 *增加识别手指敲击的手势
 *@param numberOfTouches 手指tap次数
 *@param numberOfTaps 手指数.
 */
- (void)fl_whenTouches:(NSUInteger)numberOfTouches tapped:(NSUInteger)numberOfTaps handler:(void (^)(void))block;

/** 
 *增加识别一个手指敲击一次的手势
 */
- (void)fl_whenTapped:(void (^)(void))block;

/** 
 *增加识别一个手指敲击两次的手势.
 */
- (void)fl_whenDoubleTapped:(void (^)(void))block;

/** 
 *非递归的子视图遍历
 */
- (void)fl_eachSubview:(void (^)(UIView *subview))block;

@end
