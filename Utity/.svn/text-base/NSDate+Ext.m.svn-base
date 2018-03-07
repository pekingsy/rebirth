//
//  NSDate+Ext.m
//  Pickers
//
//  Created by chaizhiyong on 14-7-30.
//
//

#import "NSDate+Ext.h"
@implementation NSDate (Ext)
//是当天返回 返回 12：00 格式 昨天的 返回 昨天  其他的返回 10/20

+ (NSString*)getGregorianCalendarWithTimeStamp:(NSString*)timeStamp
{
    if(timeStamp == nil || timeStamp.length == 0){
        return [NSString string];
    }
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeStamp floatValue]];
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];//实例化一个NSDateFormatter对象
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [NSDate date];
    NSDate *yesterday;
    
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    NSString * dateString = [[date description] substringToIndex:10];
    
    if ([dateString isEqualToString:todayString]){
        [dateFormat setDateFormat:@"HH:mm"];//设定时间格式
        NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
        [dateFormat setTimeZone:timeZone];
        NSString *dateString = [dateFormat stringFromDate:date];
        return dateString;
    } else if ([dateString isEqualToString:yesterdayString]){
        return @"昨天";
    }else{
        [dateFormat setDateFormat:@"MM/dd"];//设定时间格式
        NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
        [dateFormat setTimeZone:timeZone];
        NSString *dateString = [dateFormat stringFromDate:date];
        return dateString;
    }
    return [NSString string];
}

//是 当天返回---今天12：00格式, 昨天的返回--昨天+时间格式 , 其他的返回 10/20+时间
+ (NSString*)getGregorianCalendarAndTimeWithTimeStamp:(NSDate*)Datetime{
    if (time == nil) {
        return [NSString string];
    }
    NSLog(@"日期:%@",Datetime);
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [NSDate date];
    NSDate *tomorrow, *yesterday;
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    NSString * dateString = [[Datetime description] substringToIndex:10];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];//设定时间格式
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateFormatter setTimeZone:timeZone];
    NSString *time = [dateFormatter stringFromDate:Datetime];
    if ([dateString isEqualToString:todayString]){
        return [NSString stringWithFormat:@"今天 %@",time];
    } else if ([dateString isEqualToString:yesterdayString]){
        return [NSString stringWithFormat:@"昨天 %@",time];
    }else if ([dateString isEqualToString:tomorrowString]){
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];//设置成中国阳历
        NSDateComponents *components = [calendar components: NSCalendarUnitHour|NSCalendarUnitMinute  fromDate:Datetime];
        NSInteger month = [components month];
        NSInteger day = [components day];
        return [NSString stringWithFormat:@"%d/%d %@",month,day,time];
    }else{
        return dateString;
    }
}
/**
 /////  和当前时间比较
 ////   1）1分钟以内 显示        :    刚刚
 ////   2）1小时以内 显示        :    X分钟前
 ///    3）今天或者昨天 显示      :    今天 09:30   昨天 09:30
 ///    4) 今年显示              :   09月12日
 ///    5) 大于本年      显示    :    2013/09/09
 **/
+ (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *) formate
{
    
    @try {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:formate];
        
        NSDate * nowDate = [NSDate date];
        
        /////  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
        /////  取当前时间和转换时间两个日期对象的时间间隔
        /////  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        
        //// 再然后，把间隔的秒数折算成天数和小时数：
        
        NSString *dateStr = @"";
        
        if (time<=60) {  //// 1分钟以内的
            dateStr = @"刚刚";
        }else if(time<=60*60){  ////  一个小时以内的
            
            int mins = time/60;
            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
            
        }else if(time<=60*60*24){   //// 在两天内的
            
            [dateFormatter setDateFormat:@"YYYY/MM/dd"];
            NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
            NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
            
            [dateFormatter setDateFormat:@"HH:mm"];
            if ([need_yMd isEqualToString:now_yMd]) {
                //// 在同一天
                dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }else{
                ////  昨天
                dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }
        }else {
            
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                ////  在同一年
                [dateFormatter setDateFormat:@"MM月dd日"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy/MM/dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
}

/**
 /////  和当前时间比较
 ///    3）今天或者昨天 显示      :    今天 09:30   昨天 09:30
 ///    4) 今年显示              :   09月12日
 ///    5) 大于本年      显示    :    2013/09/09
 **/
+ (NSString *)formateDateNew:(NSString *)dateString withFormate:(NSString *) formate
{
    
    @try {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:formate];
        
        NSDate * nowDate = [NSDate date];
        
        /////  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
        /////  取当前时间和转换时间两个日期对象的时间间隔
        /////  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        
        //// 再然后，把间隔的秒数折算成天数和小时数：
        
        NSString *dateStr = @"";
        
//        if (time<=60) {  //// 1分钟以内的
//            dateStr = @"刚刚";
//        }else if(time<=60*60){  ////  一个小时以内的
//            
//            int mins = time/60;
//            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
//            
//        }else
        
        if(time<=60*60*24){   //// 在两天内的
        
            [dateFormatter setDateFormat:@"YYYY/MM/dd"];
            NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
            NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
            
            [dateFormatter setDateFormat:@"HH:mm"];
            if ([need_yMd isEqualToString:now_yMd]) {
                //// 在同一天
                dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }else{
                ////  昨天
                dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }
        }else {
            
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                ////  在同一年
                [dateFormatter setDateFormat:@"MM月dd日"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy/MM/dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
    
    
}

+(NSString *)compareDate:(NSDate *)date
{
    if (date == nil) {
        return [NSString string];
    }
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [NSDate date];
    NSDate *tomorrow, *yesterday;
    
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    
    NSString * dateString = [[date description] substringToIndex:10];
    
    if ([dateString isEqualToString:todayString]){
        return @"今天";
    } else if ([dateString isEqualToString:yesterdayString]){
        return @"昨天";
    }else if ([dateString isEqualToString:tomorrowString]){
        return @"明天";
    }else{
        return dateString;
    }
}

+ (NSString *)speCompareCurDate
{
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
     NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [dateFormatter setTimeZone:timeZone];
    //用[NSDate date]可以获取系统当前时间
     return [dateFormatter stringFromDate:[NSDate date]];
}

//2014-10-5 12:00:00 转成date
+(NSDate*)coverDateWithFormatter:(NSString*)time
{
    return [self coverDateWithFormatter:time format:nil];
}

+(NSDate *)coverDateWithFormatter:(NSString *)time format:(NSString *)format
{
    if (time == nil || time.length == 0) {
        return nil;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    if(KCNSSTRING_ISEMPTY(format)) format = @"YYYY-MM-dd HH:mm:ss";
    [formatter setDateFormat:format]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    return [formatter dateFromString:time];
}

+ (BOOL)isBetweenFromTime:(NSDate*)fromTime toTime:(NSDate*)toTime
{
    if (fromTime == nil || toTime == nil) {
        return NO;
    }
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];//设置成中国阳历
    NSDateComponents *components_start = [calendar components: NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSCalendarUnitHour|NSCalendarUnitMinute  fromDate:fromTime];
   
    NSInteger hour_start = [components_start hour];
    NSInteger minute_start = [components_start minute];
    
    NSDateComponents *components_end= [calendar components: NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSCalendarUnitHour|NSCalendarUnitMinute  fromDate:toTime];
    
    NSInteger hour_end = [components_end hour];
    NSInteger minute_end = [components_end minute];
    
    NSDate *date_start = [self getCustomDateWithHour:hour_start minute:minute_start];
    NSDate *date_end = [self getCustomDateWithHour:hour_end minute:minute_end];
    
    NSDate *currentDate = [NSDate date];
    
    if ([currentDate compare:date_start]==NSOrderedDescending && [currentDate compare:date_end]==NSOrderedAscending){
        return YES;
    }
    return NO;
}

+ (BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour
{
    NSDate *date_start = [self getCustomDateWithHour:fromHour minute:0];
    NSDate *date_end = [self getCustomDateWithHour:toHour minute:0];
    
    NSDate *currentDate = [NSDate date];
    
    if ([currentDate compare:date_start]==NSOrderedDescending && [currentDate compare:date_end]==NSOrderedAscending){
        return YES;
    }
    return NO;
}
/**
 * @brief 生成当天的某个点（返回的是伦敦时间，可直接与当前时间[NSDate date]比较）
 * @param hour 如hour为“8”，就是上午8:00（本地时间）
 */
+ (NSDate *)getCustomDateWithHour:(NSInteger)hour minute:(NSInteger)minute
{
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    [resultComps setMinute:minute];
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    return [resultCalendar dateFromComponents:resultComps];
}

- (NSString*)getTimestamp
{
    NSTimeInterval a=[self timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.0f", a];
}

+ (NSDate *)getDateWithTimeStamp:(NSString*)timeStamp
{
    if(timeStamp ==nil && timeStamp.length == 0){
        return nil;
    }
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeStamp intValue]];
    return date;
}
//传入时间戳 返回格式 上午 8:00
+ (NSString*)getGregorianWithTimeStamp:(NSString *)timeStamp
{
    if (timeStamp == nil || timeStamp.length == 0) {
        return [NSString string];
    }
    NSDate* date = [NSDate getDateWithTimeStamp:timeStamp];
    NSString* time = [NSDate getGregorianWithdate:date];
    return time;
}

//传入NSDate 返回格式 上午 8:00
+ (NSString*)getGregorianWithdate:(NSDate *)date
{
    if (date == nil) {
        return [NSString string];
    }
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];//设置成中国阳历
    NSDateComponents *components = [calendar components: NSCalendarUnitHour|NSCalendarUnitMinute  fromDate:date];
    
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    
    NSString* AMPM = (hour - 12) > 0 ? @"下午":@"上午";
    hour = (hour - 12) > 0 ? (hour - 12):hour;
    NSString* time = [NSString stringWithFormat:@"%@ %02d:%02d",AMPM, (int)hour,(int)minute];
    return time;
}

@end
