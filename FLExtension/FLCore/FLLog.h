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

///log内容写入本地文件中，使用方式同NSLog
#define FLLog(args ...) DefineFLLog(__FILE__, __LINE__, __PRETTY_FUNCTION__, args);

///日志目录路径
+(NSString *)logDirectoryPath;

///日志文件路径
+(NSString *)logFilePath;

///写日志到文件中
+(void)writeLog:(NSString *)logString;

@end
