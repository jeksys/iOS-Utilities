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

+ (NSDate*) dateWithYear:(int) year month:(int)month day:(int)day;
+ (NSDate*) dateWithDouble:(double)doubleDate;


@end
