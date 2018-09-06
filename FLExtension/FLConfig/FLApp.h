//
//  FLApp.h
//  FLExtensionDemo
//
//  Created by 杨利 on 2018/8/13.
//  Copyright © 2018年 yangli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FLApp : NSObject

/*
 * 判断是否是异形屏
 */
+(BOOL)isiPhoneXScreen;

/*
 * 取消UIScrollView自适应
 */
+(void)neverAdjustsContentInsetForScrollView:(UIScrollView *)scrollView;
+(void)neverAdjustsContentInsetForViewController:(UIViewController *)VC;

/*
 * 拉伸图片
 */
+(UIImage *)resizableImage:(UIImage *)oldImage;

@end
