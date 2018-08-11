//
//  UIGestureRecognizer+FLExtension.h
//  FLExtension
//
//  Created by yangli on 15/8/11.
//  Copyright (c) 2015年 FL. All rights reserved.
//

/** 
 使用示例:
 UITapGestureRecognizer *singleTap = [UITapGestureRecognizer recognizerWithHandler:^(id sender) {
      NSLog(@"Single tap.");
 }  delay:0.18];
 [self addGestureRecognizer:singleTap];
 
 UITapGestureRecognizer *doubleTap = [UITapGestureRecognizer recognizerWithHandler:^(id sender) {
 [singleTap cancel];
     NSLog(@"Double tap.");
 }];
 doubleTap.numberOfTapsRequired = 2;
 [self addGestureRecognizer:doubleTap];
 
*/

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (FLExtension)

- (id)fl_initWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block delay:(NSTimeInterval)delay NS_REPLACES_RECEIVER;

+ (id)fl_recognizerWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block delay:(NSTimeInterval)delay;

- (id)fl_initWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block;

+ (id)fl_recognizerWithHandler:(void (^)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location))block;

@property (nonatomic, copy, setter = fl_setHandler:) void (^fl_handler)(UIGestureRecognizer *sender, UIGestureRecognizerState state, CGPoint location);

@property (nonatomic, setter = fl_setHandlerDelay:) NSTimeInterval fl_handlerDelay;

@end
