//
//  FLApp.m
//  FLExtensionDemo
//
//  Created by 杨利 on 2018/8/13.
//  Copyright © 2018年 yangli. All rights reserved.
//

#import "FLApp.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@implementation FLApp

+(BOOL)isiPhoneXScreen
{
    if (@available(iOS 11.0, *)){
        UIEdgeInsets edgeInset = [UIApplication sharedApplication].windows[0].safeAreaInsets;
        if (UIEdgeInsetsEqualToEdgeInsets(edgeInset, UIEdgeInsetsZero)) {
            return NO;
        }else{
            return YES;
        }
    }else{
        return NO;
    }
}

+(void)neverAdjustsContentInsetForScrollView:(UIScrollView *)scrollView
{
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
    }
}

+(void)neverAdjustsContentInsetForViewController:(UIViewController *)VC
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    VC.automaticallyAdjustsScrollViewInsets = NO;
#pragma clang diagnostic pop
}


+(UIImage *)resizableImage:(UIImage *)oldImage
{
    UIImage *image = oldImage;
    // 设置端盖的值
    CGFloat top = image.size.height * 0.5;
    CGFloat left = image.size.width * 0.5;
    CGFloat bottom = image.size.height * 0.5;
    CGFloat right = image.size.width * 0.5;
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
    
    // 拉伸图片
    UIImage *newImage1 = [image resizableImageWithCapInsets:edgeInsets];
    return newImage1;
}

////是否有麦克风权限
//+(BOOL)canRecordPermission
//{
//    __block BOOL bCanRecord = YES;
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)
//    {
//        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
//        if ([audioSession respondsToSelector:@selector(requestRecordPermission:)]) {
//            [audioSession performSelector:@selector(requestRecordPermission:) withObject:^(BOOL granted) {
//                if (granted) {
//                    bCanRecord = YES;
//                }else {
//                    bCanRecord = NO;//
//                }
//            }];
//        }
//    }
//    return bCanRecord;
//}
//
//+(BOOL)canCameraPermission
//{
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
//        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
//        if (authStatus == AVAuthorizationStatusDenied || authStatus == AVAuthorizationStatusRestricted) {
//            return NO;
//        }
//        return YES;
//    }
//    return NO;
//}
//
//+(BOOL)canPhotoPermission
//{
//    //判断是否已授权
//    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
//        ALAuthorizationStatus authStatus = [ALAssetsLibrary authorizationStatus];
//        if (authStatus == ALAuthorizationStatusDenied || authStatus ==  ALAuthorizationStatusRestricted) {
//            return NO;
//        }
//        return YES;
//    }
//    return NO;
//}
//
//+ (BOOL)canNotificationPermission {
//    //iOS8 check if user allow notification
//    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
//    if (UIUserNotificationTypeNone != setting.types) {
//        return YES;
//    }
//    return NO;
//}

@end
