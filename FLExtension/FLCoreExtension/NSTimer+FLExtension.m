//
//  NSTimer+FLExtension.m
//  FLExtension
//
//  Created by yangli on 15/8/11.
//  Copyright (c) 2015年 FL. All rights reserved.
//

#import "NSTimer+FLExtension.h"

@interface NSTimer (BlocksKitPrivate)

+ (void)fl_executeBlockFromTimer:(NSTimer *)aTimer;

@end

@implementation NSTimer (FLExtension)


+ (id)fl_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(NSTimer *timer))block repeats:(BOOL)inRepeats
{
    NSParameterAssert(block != nil);
    return [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(fl_executeBlockFromTimer:) userInfo:[block copy] repeats:inRepeats];
}

+ (id)fl_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(NSTimer *timer))block repeats:(BOOL)inRepeats
{
    NSParameterAssert(block != nil);
    return [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(fl_executeBlockFromTimer:) userInfo:[block copy] repeats:inRepeats];
}

+ (void)fl_executeBlockFromTimer:(NSTimer *)aTimer {
    void (^block)(NSTimer *) = [aTimer userInfo];
    if (block) block(aTimer);
}

@end
