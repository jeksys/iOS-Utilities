//
//  Created by Evgeny Yagrushkin on 2013-07-01.
//  Copyright (c) 2013 Evgeny Yagrushkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (EYTools)

- (NSString*) shortFormatMDY;
- (NSString*) shortFormat;
- (NSString*) linkedInFormat;
- (NSString*) yearOnlyFormat;
- (NSString*) shortTimeStampFormat;
- (NSString*) longFormat;
- (NSString*) longFormatAMPM;
- (NSString*) longFormatMDY;
- (NSString*) longFormatDayMDY;
- (NSString*) timeFormat;
- (NSString*) timeFormatShort;
- (NSString*) customFormatWithString:(NSString*)string;

+ (NSDate*) dateWithYear:(int) year month:(int)month day:(int)day;
+ (NSDate*) dateWithDouble:(double)doubleDate;

- (NSDate *)dateByMovingToNearestDayOfWeek:(NSUInteger)dayOfWeek;
+ (NSDate *)dateByMovingToNearestTimeFromDate:(NSDate *)date;
+ (NSDate *)timeValueFromDate:(NSDate *)date;
+ (NSDate *)dateByDroppingSecondsFromDate:(NSDate *)date;
- (NSDate*) updateDateWithHour:(NSUInteger)hour andMinutes:(NSUInteger)minutes;
- (NSDate*) updateDateWithHHMM:(NSString*)hhmmString;

- (NSDate*) updateDateComponentWithDate:(NSDate*)date;

- (NSDate*) convertToUTC;
- (NSDate*) convertToTimeZone:(NSString*)timeZone;
- (NSUInteger) dayofWeek;

- (BOOL)isEqualToDate:(NSDate *)date2 withGranularity:(NSCalendarUnit)granularity;
- (NSString*)formatTimeIntervalWithComponents:(NSCalendarUnit)unitFlags toDate:(NSDate*)toDate;
- (NSString*)formatTimeIntervalWithComponents:(NSCalendarUnit)unitFlags toDate:(NSDate*)toDate withTimeUnits:(BOOL)showTimeUnits;


@end
