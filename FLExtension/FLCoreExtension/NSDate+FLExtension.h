//
//  NSDate+FLExtension.h
//  FLExtensionDemo
//
//  Created by 杨利 on 2018/12/17.
//  Copyright © 2018年 yangli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (FLExtension)

@property (nonatomic,assign)NSInteger year;
@property (nonatomic,assign)NSInteger month;
@property (nonatomic,assign)NSInteger day;
@property (nonatomic,assign)NSInteger hour;
@property (nonatomic,assign)NSInteger minute;
@property (nonatomic,assign)NSInteger second;
@property (nonatomic,assign)BOOL isToday;///< 是否是今天
@property (nonatomic,assign)BOOL isYesterday;///< 是否是昨天
@property (nonatomic,assign)BOOL isTomorrow;///< 是否是明天

/// 根据dateFormat（yyyy-MM-dd HH:mm:ss）获取时间戳
- (NSString *)stringWithDateFormat:(NSString *)dateFormat;

/// 两个日期是否是同一天
+ (BOOL)isDate:(NSDate *)date1 inSameDayAsDate:(NSDate *)date2;

@end


