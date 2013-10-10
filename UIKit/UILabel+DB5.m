//
//  UILabel+DB5.m
//  BreakfastTelevision
//
//  Created by Evgeny Yagrushkin on 2013-09-04.
//  Copyright (c) 2013 Rogers Media. All rights reserved.
//

#import "UILabel+DB5.h"
#import "VSTheme.h"

@implementation UILabel (DB5)

- (void) DB5WithTheme:(VSTheme*)theme andKey:(NSString*)key{

    self.font = [theme fontForKey:[key stringByAppendingString:@"Font"]];
    self.textColor = [theme colorForKey:[key stringByAppendingString:@"FontColor"]];

}

@end
