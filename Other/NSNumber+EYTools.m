//
//  NSNumber+utils.m
//  Cravit
//
//  Created by Evgeny Yagrushkin on 2013-03-21.
//  Copyright (c) 2013 Evgeny Yagrushkin. All rights reserved.
//

#import "NSNumber+EYTools.h"

@implementation NSNumber (EYTools)

- (NSString*) currencyString{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:[NSLocale currentLocale]];
    return [numberFormatter stringFromNumber:self];
}

@end
