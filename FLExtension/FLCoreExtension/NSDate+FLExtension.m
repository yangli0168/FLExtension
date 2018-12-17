//
//  NSDate+FLExtension.m
//  FLExtensionDemo
//
//  Created by 杨利 on 2018/12/17.
//  Copyright © 2018年 yangli. All rights reserved.
//

#import "NSDate+FLExtension.h"

@implementation NSDate (FLExtension)

-(NSInteger)year
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    return [components year];
}

-(NSInteger)month
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    return [components month];
}

-(NSInteger)day
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    return [components day];
}

-(NSInteger)hour
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour fromDate:self];
    return [components hour];
}

-(NSInteger)minute
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitMinute fromDate:self];
    return [components minute];
}

-(NSInteger)second
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitSecond fromDate:self];
    return [components second];
}

- (BOOL)isToday
{
    return [[NSCalendar currentCalendar] isDateInToday:self];
}

- (BOOL)isYesterday
{
    return [[NSCalendar currentCalendar] isDateInYesterday:self];
}

- (BOOL)isTomorrow
{
    return [[NSCalendar currentCalendar] isDateInTomorrow:self];
}

+ (BOOL)isDate:(NSDate *)date1 inSameDayAsDate:(NSDate *)date2
{
    return [[NSCalendar currentCalendar] isDate:date1 inSameDayAsDate:date2];
}

- (NSString *)stringWithDateFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter stringFromDate:self];
}


@end
