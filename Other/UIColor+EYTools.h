//
//  UIColor+EYTools.h
//  FXNow
//
//  Created by Evgeny Yagrushkin on 2/18/2014.
//  Copyright (c) 2014 Rogers Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (EYTools)

- (UIColor *)lighterColorForColor;
- (UIColor *)darkerColorForColor;

+(UIColor *) colorWithHexString:(NSString*)hexString;

@end
