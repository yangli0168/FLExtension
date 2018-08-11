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

#ifdef DEBUG

#define FLLog(args ...) DefineFLLog(__FILE__, __LINE__, __PRETTY_FUNCTION__, args);
#define FLLogString [FLLog logString]
#define FLLogClear [FLLog clearLog]

#else

#define FLLog(args ...)
#define FLLogString
#define FLLogClear

#endif

+ (void)clearLog;

+ (NSString *)logString;

@end
