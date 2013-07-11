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

static NSDate *startDate;

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
		[longFormatFormatterMDY setDateFormat:@"MMMM dd, yyyy"];
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

@end
