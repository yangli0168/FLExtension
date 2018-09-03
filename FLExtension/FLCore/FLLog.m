//
//  FLLog.m
//  FLExtension
//
//  Created by yangli on 15/8/11.
//  Copyright (c) 2015年 FL. All rights reserved.
//

#import "FLLog.h"

static NSString *logString = @"";

@implementation FLLog

void DefineFLLog(const char *file, int lineNumber, const char *functionName, NSString *format, ...)
{
    va_list ap;
    
    va_start (ap, format);
    
    if (![format hasSuffix: @"\n"])
    {
        format = [format stringByAppendingString: @"\n"];
    }
    
    NSString *content = [[NSString alloc] initWithFormat:format arguments:ap];
    
    va_end (ap);
    
    //NSString *fileName = [[NSString stringWithUTF8String:file] lastPathComponent];
    //fprintf(stderr, "FLLog %s %d \n $func$: %s  \n $content$: %s",  [fileName UTF8String],lineNumber,functionName,[content UTF8String]);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss.SSSS"];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    NSString *date = [formatter stringFromDate:[NSDate date]];
    
    fprintf(stderr, "%s FLLog %s +%d \n%s",[date UTF8String],functionName,lineNumber,[content UTF8String]);
    
    
    if([logString isEqualToString:@""])
        logString = content;
    else
        logString = [NSString stringWithFormat:@"%@%@", logString, content];
}

+ (NSString *)logString
{
    return logString;
}

+ (void)clearLog
{
    logString = @"";
}


@end
