//
//  NSDate+Ext.h
//  Pickers
//
//  Created by chaizhiyong on 14-7-30.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (Ext)
- (NSString*)getTimestamp; //返回时间戳

//是当天返回 返回 12：00 格式 昨天的 返回 昨天  其他的返回 10/20
+ (NSString*)getGregorianCalendarWithTimeStamp:(NSString*)timeStamp;
//是 当天返回---今天12：00格式, 昨天的返回--昨天+时间格式 , 其他的返回 10/20+时间
+ (NSString*)getGregorianCalendarAndTimeWithTimeStamp:(NSDate*)Datetime;

//返回格式  上午  12：00：00
+ (NSString *)compareDate:(NSDate *)date;
//返回格式  2014-12-00  12：00：00
+ (NSString *)speCompareCurDate;
//loveCode 
+ (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *) formate;
+ (NSString *)formateDateNew:(NSString *)dateString withFormate:(NSString *) formate;
+ (NSDate*)coverDateWithFormatter:(NSString*)time;  //2014-10-5 12:00:00 转成date
+(NSDate *)coverDateWithFormatter:(NSString *)time format:(NSString *)format;

+ (BOOL)isBetweenFromTime:(NSDate*)fromTime toTime:(NSDate*)toTime; //判断当前时间是否在一天的某个时间段内

+ (BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour;

+ (NSDate *)getDateWithTimeStamp:(NSString*)timeStamp;

//返回格式 上午 8:00
+ (NSString*)getGregorianWithTimeStamp:(NSString *)timeStamp;

//传入NSDate 返回格式 上午 8:00
+ (NSString*)getGregorianWithdate:(NSDate *)date;
@end
