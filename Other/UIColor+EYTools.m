//
//  UIColor+EYTools.m
//  FXNow
//
//  Created by Evgeny Yagrushkin on 2/18/2014.
//  Copyright (c) 2014 Rogers Media. All rights reserved.
//

#import "UIColor+EYTools.h"

@implementation UIColor (EYTools)

static BOOL stringIsEmpty(NSString *s) {
	return s == nil || [s length] == 0;
}

static UIColor *colorWithHexString(NSString *hexString) {
    
	/*Picky. Crashes by design.*/
	
	if (stringIsEmpty(hexString))
		return [UIColor blackColor];
    
	NSMutableString *s = [hexString mutableCopy];
	[s replaceOccurrencesOfString:@"#" withString:@"" options:0 range:NSMakeRange(0, [hexString length])];
	CFStringTrimWhitespace((__bridge CFMutableStringRef)s);
    
	NSString *redString = [s substringToIndex:2];
	NSString *greenString = [s substringWithRange:NSMakeRange(2, 2)];
	NSString *blueString = [s substringWithRange:NSMakeRange(4, 2)];
    
	unsigned int red = 0, green = 0, blue = 0;
	[[NSScanner scannerWithString:redString] scanHexInt:&red];
	[[NSScanner scannerWithString:greenString] scanHexInt:&green];
	[[NSScanner scannerWithString:blueString] scanHexInt:&blue];
    
	return [UIColor colorWithRed:(CGFloat)red/255.0f green:(CGFloat)green/255.0f blue:(CGFloat)blue/255.0f alpha:1.0f];
}


@end
