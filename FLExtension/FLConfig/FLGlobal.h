//
//  FLGlobal.h
//  FLJobClub
//
//  Created by yangli on 15/8/12.
//  Copyright (c) 2015年 FL. All rights reserved.
//
#import "FLApp.h"

#pragma mark Screen
/// 屏幕高度、宽度
#define Kwidth [[UIScreen mainScreen] bounds].size.width
#define Kheight [[UIScreen mainScreen] bounds].size.height

//iphone x适配相关
//iphone x StatusBar+NavgationBar高度
#define SafeAreaTopHeight ([FLApp isiPhoneXScreen] ? 88 : 64)
//iphone x 底部圆角区域高度
#define SafeAreaBottomHeight ([FLApp isiPhoneXScreen] ? 34 : 0)
//iphone x StatusBar高度
#define SafeAreaStatusBarHeight ([FLApp isiPhoneXScreen] ? 44 : 20)
//iphone x TabBar+底部圆角区域高度
#define SafeAreaTabBarHeight ([FLApp isiPhoneXScreen] ? 83 : 49)


#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}

#pragma mark - System Version
// 当前系统版本大于等于某版本
#define IOS_SYSTEM_VERSION_EQUAL_OR_ABOVE(v) (([[[UIDevice currentDevice] systemVersion] floatValue] >= (v))? (YES):(NO))

// 当前系统版本小于等于某版本
#define IOS_SYSTEM_VERSION_EQUAL_OR_BELOW(v) (([[[UIDevice currentDevice] systemVersion] floatValue] <= (v))? (YES):(NO))

//获取应用名
#define APP_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

//获取BundleVersion
#define APP_BUILD [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

//获取ShortVersion
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#pragma mark - view size, frame
/** 根据字符串、最大尺寸、字体计算字符串最合适尺寸 */
static inline CGSize CGSizeOfString(NSString * text, CGSize maxSize, UIFont * font) {
    CGSize fitSize;
#ifdef __IPHONE_7_0
    
    fitSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
#else
    fitSize = [text sizeWithFont:font constrainedToSize:maxSize];
#endif
    return fitSize;
}


//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]

