//
//  NSObject+FLExtension.h
//  FLExtension
//
//  Created by yangli on 15/8/11.
//  Copyright (c) 2015年 FL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FLExtension)

/**
 *delay时间后在主线程执行某些操作
 */
- (id)fl_performBlock:(void (^)(id obj))block afterDelay:(NSTimeInterval)delay;
+ (id)fl_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

/**
 *delay时间后在后台线程执行某些操作
 */
- (id)fl_performBlockInBackground:(void (^)(id obj))block afterDelay:(NSTimeInterval)delay;
+ (id)fl_performBlockInBackground:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end
