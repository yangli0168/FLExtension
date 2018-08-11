//
//  UIView+FLExtension.m
//  FLExtension
//
//  Created by yangli on 15/8/11.
//  Copyright (c) 2015年 FL. All rights reserved.
//

#import "UIView+FLExtensionForTouch.h"
#import "UIGestureRecognizer+FLExtension.h"

@implementation UIView (FLExtensionForTouch)

- (void)fl_whenTouches:(NSUInteger)numberOfTouches tapped:(NSUInteger)numberOfTaps handler:(void (^)(void))block
{
    if (!block) return;
    
    UITapGestureRecognizer *gesture = [UITapGestureRecognizer fl_recognizerWithHandler:^(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location) {
        if (state == UIGestureRecognizerStateRecognized) block();
    }];
    
    gesture.numberOfTouchesRequired = numberOfTouches;
    gesture.numberOfTapsRequired = numberOfTaps;
    
    [self.gestureRecognizers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (![obj isKindOfClass:[UITapGestureRecognizer class]]) return;
        
        UITapGestureRecognizer *tap = obj;
        BOOL rightTouches = (tap.numberOfTouchesRequired == numberOfTouches);
        BOOL rightTaps = (tap.numberOfTapsRequired == numberOfTaps);
        if (rightTouches && rightTaps) {
            [gesture requireGestureRecognizerToFail:tap];
        }
    }];
    
    [self addGestureRecognizer:gesture];
}

- (void)fl_whenTapped:(void (^)(void))block
{
    [self fl_whenTouches:1 tapped:1 handler:block];
}

- (void)fl_whenDoubleTapped:(void (^)(void))block
{
    [self fl_whenTouches:2 tapped:1 handler:block];
}

- (void)fl_eachSubview:(void (^)(UIView *subview))block
{
    NSParameterAssert(block != nil);
    
    [self.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
        block(subview);
    }];
}


@end
