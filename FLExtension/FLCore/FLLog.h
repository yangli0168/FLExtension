//
//  FLLog.h
//  FLExtension
//
//  Created by yangli on 15/8/11.
//  Copyright (c) 2015年 FL. All rights reserved.
//

#import <Foundation/Foundation.h>

void DefineFLLog(const char *file, int lineNumber, const char *functionName, NSString *format, ...);

@interface FLLog : NSObject


/**
 FLLog debug模式下直接执行NSLog，release模式下记录内容到本地文件中
 
 @param ... 支持传入过个NSString类型数据
 */
#define FLLog(args ...) DefineFLLog(__FILE__, __LINE__, __PRETTY_FUNCTION__, args);

+(void)writeLog:(NSString *)logString;

@end
