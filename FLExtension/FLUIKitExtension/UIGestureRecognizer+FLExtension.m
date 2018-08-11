//
//  UIGestureRecognizer+FLExtension.m
//  FLExtension
//
//  Created by yangli on 15/8/11.
//  Copyright (c) 2015年 FL. All rights reserved.
//

#import "UIGestureRecognizer+FLExtension.h"
#import <objc/runtime.h>

static const void *FLGestureRecognizerBlockKey = &FLGestureRecognizerBlockKey;
static const void *FLGestureRecognizerDelayKey = &FLGestureRecognizerDelayKey;
static const void *FLGestureRecognizerShouldHandleActionKey = &FLGestureRecognizerShouldHandleActionKey;

@interface UIGestureRecognizer (FLExtensionInternal)

@property (nonatomic, setter = fl_setShouldHandleAction:) BOOL fl_shouldHandleAction;

- (void)fl_handleAction:(UIGestureRecognizer *)recognizer;

@end


@implementation UIGestureRecognizer (FLExtension)

+ (id)fl_recognizerWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block delay:(NSTimeInterval)delay
{
    return [[[self class] alloc] fl_initWithHandler:block delay:delay];
}

- (id)fl_initWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block delay:(NSTimeInterval)delay
{
    self = [self initWithTarget:self action:@selector(fl_handleAction:)];
    if (!self) return nil;
    
    self.fl_handler = block;
    self.fl_handlerDelay = delay;
    
    return self;
}

+ (id)fl_recognizerWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block
{
    return [self fl_recognizerWithHandler:block delay:0.0];
}

- (id)fl_initWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block
{
    return [self fl_initWithHandler:block delay:0.0];
}

- (void)fl_handleAction:(UIGestureRecognizer *)recognizer
{
    void (^handler)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) = recognizer.fl_handler;
    if (!handler) return;
    
    NSTimeInterval delay = self.fl_handlerDelay;
    CGPoint location = [self locationInView:self.view];
    void (^block)(void) = ^{
        if (!self.fl_shouldHandleAction) return;
        handler(self, self.state, location);
    };
    
    self.fl_shouldHandleAction = YES;
    
    if (!delay) {
        block();
        return;
    }
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

- (void)fl_setHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))handler
{
    objc_setAssociatedObject(self, FLGestureRecognizerBlockKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))fl_handler
{
    return objc_getAssociatedObject(self, FLGestureRecognizerBlockKey);
}

- (void)fl_setHandlerDelay:(NSTimeInterval)delay
{
    NSNumber *delayValue = delay ? @(delay) : nil;
    objc_setAssociatedObject(self, FLGestureRecognizerDelayKey, delayValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)fl_handlerDelay
{
    return [objc_getAssociatedObject(self, FLGestureRecognizerDelayKey) doubleValue];
}

- (void)fl_setShouldHandleAction:(BOOL)flag
{
    objc_setAssociatedObject(self, FLGestureRecognizerShouldHandleActionKey, @(flag), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)fl_shouldHandleAction
{
    return [objc_getAssociatedObject(self, FLGestureRecognizerShouldHandleActionKey) boolValue];
}

- (void)fl_cancel
{
    self.fl_shouldHandleAction = NO;
}

@end
