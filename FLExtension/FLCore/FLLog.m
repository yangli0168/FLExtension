//
//  FLLog.m
//  FLExtension
//
//  Created by yangli on 15/8/11.
//  Copyright (c) 2015年 FL. All rights reserved.
//

#import "FLLog.h"
#define CurrentFilePath @"SmartCall_t.txt"   ///< 储存当前log文件
#define BackupFilePath @"SmartCall_t_1.txt"  ///< 存储备份log文件
#define LogFileMaxSize 3*1024*1024            ///< log文件最大空间(M)

static dispatch_queue_t writeLogQueue;

@implementation FLLog

+(void)load
{
    writeLogQueue = dispatch_queue_create("writeLogQueue", DISPATCH_QUEUE_CONCURRENT); // 创建异步队列，用于写入日志
}

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
    
#ifdef DEBUG
    
    NSLog(@"%@",content);
#else
    //dispatch_barrier_async 保证任务按顺序执行
    dispatch_barrier_async(writeLogQueue, ^{
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss.SSSS"];
        formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        NSString *timeString = [formatter stringFromDate:[NSDate date]];
        NSString *_content = [NSString stringWithFormat:@"%@|%s:%@",timeString,functionName,content];
        [FLLog writeLog:_content];
    });
    
#endif
    
}

+(NSString *)logDirectoryPath
{
    NSString *documentsPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *directoryPath = [documentsPath stringByAppendingPathComponent:@"cylanLog"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:directoryPath]) {
        [fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return directoryPath;
}

+(NSString *)logFilePath
{
    return [self filePathForLastPath:CurrentFilePath];
}

+(NSString *)filePathForLastPath:(NSString *)lastPath
{
    NSString *logFilePath = [self logDirectoryPath];
    logFilePath = [logFilePath stringByAppendingPathComponent:lastPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:logFilePath]) {
        [fileManager createFileAtPath:logFilePath contents:nil attributes:nil];
    }
    return logFilePath;
}

///文件大小
+ (float)fileSizeForPath:(NSString *)filePath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    return  [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
}

+(void)writeLog:(NSString *)logString
{
    NSString *filePath = [self filePathForLastPath:CurrentFilePath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([self fileSizeForPath:filePath] > LogFileMaxSize) {
        
        NSString *backupFilePath = [self filePathForLastPath:BackupFilePath];
        if ([fileManager fileExistsAtPath:backupFilePath]) {
            [fileManager removeItemAtPath:backupFilePath error:nil];
            backupFilePath = [self filePathForLastPath:BackupFilePath];
        }
        
        if ([fileManager copyItemAtPath:filePath toPath:backupFilePath error:nil]) {
            [fileManager removeItemAtPath:filePath error:nil];
            filePath = [self filePathForLastPath:CurrentFilePath];
        }
        
    }
    NSString *jsonStr = logString;
    NSFileHandle *file = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    // 在文件的末尾添加内容。如果想在开始写 [file seekToFileOffset:0];
    [file seekToEndOfFile];
    NSData *strData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    [file writeData:strData];
}





@end
