//
//  ShakeWindow.m
//  Boatbee
//
//  Created by Evgeny Yagrushkin on 2014-07-26.
//  Copyright (c) 2014 BoatBee Inc. All rights reserved.
//

#import "ShakeWindow.h"

@implementation ShakeWindow

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake) {
    	[[NSNotificationCenter defaultCenter] postNotificationName:@"DeviceShaken" object:self];
    }
}

@end
