//
//  NSObject+FLExtension.m
//  FLExtension
//
//  Created by yangli on 15/8/11.
//  Copyright (c) 2015年 FL. All rights reserved.
//

#import "NSObject+FLExtension.h"
#define BKTimeDelay(t) dispatch_time(DISPATCH_TIME_NOW, (uint64_t)(NSEC_PER_SEC * t))

@implementation NSObject (FLExtension)

- (id)fl_performBlock:(void (^)(id obj))block afterDelay:(NSTimeInterval)delay
{
    return [self fl_performBlock:block onQueue:dispatch_get_main_queue() afterDelay:delay];
}

+ (id)fl_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay
{
    return [NSObject fl_performBlock:block onQueue:dispatch_get_main_queue() afterDelay:delay];
}

- (id)fl_performBlockInBackground:(void (^)(id obj))block afterDelay:(NSTimeInterval)delay
{
    return [self fl_performBlock:block onQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0) afterDelay:delay];
}

+ (id)fl_performBlockInBackground:(void (^)(void))block afterDelay:(NSTimeInterval)delay
{
    return [NSObject fl_performBlock:block onQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0) afterDelay:delay];
}

- (id)fl_performBlock:(void (^)(id obj))block onQueue:(dispatch_queue_t)queue afterDelay:(NSTimeInterval)delay
{
    NSParameterAssert(block != nil);
    
    __block BOOL cancelled = NO;
    
    void (^wrapper)(BOOL) = ^(BOOL cancel) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        if (!cancelled) block(self);
    };
    
    dispatch_after(BKTimeDelay(delay), queue, ^{
        wrapper(NO);
    });
    
    return [wrapper copy];
}

+ (id)fl_performBlock:(void (^)(void))block onQueue:(dispatch_queue_t)queue afterDelay:(NSTimeInterval)delay
{
    NSParameterAssert(block != nil);
    
    __block BOOL cancelled = NO;
    
    void (^wrapper)(BOOL) = ^(BOOL cancel) {
        if (cancel) {
            cancelled = YES;
            return;
        }
        if (!cancelled) block();
    };
    
    dispatch_after(BKTimeDelay(delay), queue, ^{ wrapper(NO); });
    
    return [wrapper copy];
}


@end
