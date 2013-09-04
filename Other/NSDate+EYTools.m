//
//  Created by Evgeny Yagrushkin on 2013-07-01.
//  Copyright (c) 2013 Evgeny Yagrushkin. All rights reserved.
//

#define SECOND     1
#define MINUTE (  60 * SECOND )
#define HOUR   (  60 * MINUTE )
#define DAY    (  24 * HOUR   )
#define WEEK   (   7 * DAY    )
#define MONTH  (  30 * DAY    )
#define YEAR   ( 365 * DAY    )

#import "NSDate+EYTools.h"

@implementation NSDate (EYTools)

- (NSString*) shortFormat{
    static NSDateFormatter* formatter;
	if(formatter == nil) {
		formatter = [[NSDateFormatter alloc] init];
		NSLocale* enUS = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		[formatter setLocale: enUS];
		[formatter setLenient: YES];
		[formatter setDateFormat:@"yyyy-MM-dd"];
	}
	return [formatter stringFromDate:self];
}

- (NSString*) shortFormatMDY{
    static NSDateFormatter* formaterMDY;
	if(formaterMDY == nil) {
		formaterMDY = [[NSDateFormatter alloc] init];
		NSLocale* enUS = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		[formaterMDY setLocale: enUS];
		[formaterMDY setLenient: YES];
		[formaterMDY setDateFormat:@"yyyy-MM-dd"];
	}
	return [formaterMDY stringFromDate:self];
}

- (NSString*) longFormat{
    static NSDateFormatter* longFormatFormatter;
	if(longFormatFormatter == nil) {
		longFormatFormatter = [[NSDateFormatter alloc] init];
		NSLocale* enUS = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		[longFormatFormatter setLocale: enUS];
		[longFormatFormatter setLenient: YES];
		[longFormatFormatter setDateFormat:@"MMM dd, yyyy HH:mm"];

	}
	return [longFormatFormatter stringFromDate:self];
}

- (NSString*) longFormatMDY{
    static NSDateFormatter* longFormatFormatterMDY;
	if(longFormatFormatterMDY == nil) {
		longFormatFormatterMDY = [[NSDateFormatter alloc] init];
		NSLocale* enUS = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		[longFormatFormatterMDY setLocale: enUS];
		[longFormatFormatterMDY setLenient: YES];
		[longFormatFormatterMDY setDateFormat:@"MMM dd, yyyy"];
	}
	return [longFormatFormatterMDY stringFromDate:self];
}

- (NSString*) longFormatAMPM{
    static NSDateFormatter* longFormatAMPMFormatter;
	if(longFormatAMPMFormatter == nil) {
		longFormatAMPMFormatter = [[NSDateFormatter alloc] init];
		NSLocale* enUS = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		[longFormatAMPMFormatter setLocale: enUS];
		[longFormatAMPMFormatter setLenient: YES];
		[longFormatAMPMFormatter setDateFormat:@"MMM dd, yyyy hh:mm a"];
	}
	return [longFormatAMPMFormatter stringFromDate:self];
}

- (NSString*) linkedInFormat{
    static NSDateFormatter* linkedInFormatter;
	if(linkedInFormatter == nil) {
		linkedInFormatter = [[NSDateFormatter alloc] init];
		NSLocale* enUS = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		[linkedInFormatter setLocale: enUS];
		[linkedInFormatter setLenient: YES];
		[linkedInFormatter setDateFormat:@"MMMM yyyy"];
	}
	return [linkedInFormatter stringFromDate:self];
}

- (NSString*) shortTimeStampFormat{
    static NSDateFormatter* shortTimeStampFormatter;
	if(shortTimeStampFormatter == nil) {
		shortTimeStampFormatter = [[NSDateFormatter alloc] init];
		NSLocale* enUS = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		[shortTimeStampFormatter setLocale: enUS];
		[shortTimeStampFormatter setLenient: YES];
		[shortTimeStampFormatter setDateFormat:@"yy-MM-dd HH:mm"];
	}
	return [shortTimeStampFormatter stringFromDate:self];
}


- (NSString*) yearOnlyFormat{
    static NSDateFormatter* yearOnlyFormatter;
	if(yearOnlyFormatter == nil) {
		yearOnlyFormatter = [[NSDateFormatter alloc] init];
		NSLocale* enUS = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		[yearOnlyFormatter setLocale: enUS];
		[yearOnlyFormatter setLenient: YES];
		[yearOnlyFormatter setDateFormat:@"yyyy"];
	}
	return [yearOnlyFormatter stringFromDate:self];
}

+ (NSDate*) dateWithDouble:(double)doubleDate{
    if (doubleDate > 0 ) {
        return [NSDate dateWithTimeIntervalSince1970:(doubleDate / 1000)];
    }
    return nil;
}

+ (NSDate*) dateWithYear:(int) year month:(int)month day:(int)day{
    
    NSDate *newDate = nil;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    newDate = [df dateFromString:[NSString stringWithFormat:@"%d-%d-%d", year, month, day]];
    
    return newDate;
}

- (NSString*) timeFormat{
    static NSDateFormatter* timeFormatter;
	if(timeFormatter == nil) {
		timeFormatter = [[NSDateFormatter alloc] init];
		NSLocale* enUS = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		[timeFormatter setLocale: enUS];
		[timeFormatter setLenient: YES];
		[timeFormatter setDateFormat:@"hh:mm:ss"];
	}
	return [timeFormatter stringFromDate:self];
}

- (NSString*) timeFormatShort{
    static NSDateFormatter* timeFormatter;
	if(timeFormatter == nil) {
		timeFormatter = [[NSDateFormatter alloc] init];
		NSLocale* enUS = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		[timeFormatter setLocale: enUS];
		[timeFormatter setLenient: YES];
		[timeFormatter setDateFormat:@"hh:mm a"];
	}
	return [timeFormatter stringFromDate:self];
}

- (NSString*) longFormatDayMDY{
    static NSDateFormatter* longFormatDayMDY;
	if(longFormatDayMDY == nil) {
		longFormatDayMDY = [[NSDateFormatter alloc] init];
		NSLocale* enUS = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
		[longFormatDayMDY setLocale: enUS];
		[longFormatDayMDY setLenient: YES];
		[longFormatDayMDY setDateFormat:@"EEE MMMM dd/yy"];
	}
	return [longFormatDayMDY stringFromDate:self];
}

- (NSDate*) updateDateComponentWithDate:(NSDate*)date{

    NSCalendar *cal = [[NSCalendar alloc] init];
    NSDateComponents *components = [cal components:0 fromDate:date];
    int year = [components year];
    int month = [components month];
    int day = [components day];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:year];
    [comps setMonth:month];
    [comps setYear:day];
    
    return [[NSCalendar currentCalendar] dateFromComponents:comps];
}

- (NSDate*) updateDateWithHour:(NSUInteger)hour andMinutes:(NSUInteger)minutes{
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components: NSYearCalendarUnit| NSMonthCalendarUnit| NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:[NSDate date]];
    
    [components setHour:hour];
    [components setMinute:minutes];
    
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

+ (NSDate *)dateByDroppingSecondsFromDate:(NSDate *)date
{
    NSTimeInterval timeInterval = floor([date timeIntervalSinceReferenceDate] / 60.0) * 60.0;
    NSDate *roundedDate = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
    return roundedDate;
}

+ (NSDate *)timeValueFromDate:(NSDate *)date
{
    // Create Gregorian calendar with current locale
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    calendar.locale = [NSLocale currentLocale];
    
    // Get time components from specified date
    NSUInteger timeFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *timeComponents = [calendar components:timeFlags fromDate:date];
    
    NSDate *timeDate = [calendar dateFromComponents:timeComponents];
    return timeDate;
}

+ (NSDate *)dateByMovingToNearestTimeFromDate:(NSDate *)date
{
    // Create Gregorian calendar with current locale
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    calendar.locale = [NSLocale currentLocale];
    
    // Get date components from today date and time components from target date and merge it
    NSUInteger dateFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSUInteger timeFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDateComponents *todayDateComponents = [calendar components:dateFlags fromDate:[NSDate date]];
    NSDateComponents *targetTimeComponents = [calendar components:timeFlags fromDate:date];
    
    NSDateComponents *newComponents = [[NSDateComponents alloc] init];
    newComponents.year = todayDateComponents.year;
    newComponents.month = todayDateComponents.month;
    newComponents.day = todayDateComponents.day;
    newComponents.hour = targetTimeComponents.hour;
    newComponents.minute = targetTimeComponents.minute;
    newComponents.second = targetTimeComponents.second;
    
    // Create calculated date. If it earlier than now time, add one day to it
    NSDate *newDate = [calendar dateFromComponents:newComponents];
    if ([newDate compare:[NSDate date]] == NSOrderedAscending) {
        NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
        dayComponent.day = 1;
        
        newDate = [calendar dateByAddingComponents:dayComponent toDate:newDate options:0];
    }
    
    return newDate;
}


@end
