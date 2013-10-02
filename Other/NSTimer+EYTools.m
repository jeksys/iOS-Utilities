//
//  NSTimer+EYTools.m
//  BreakfastTelevision
//
//  Created by Evgeny Yagrushkin on 2013-08-19.
//  Copyright (c) 2013 Rogers Media. All rights reserved.
//

#import "NSTimer+EYTools.h"

@interface NSTimer (Private)
+ (void)bk_executeBlockFromTimer:(NSTimer *)aTimer;
@end

@implementation NSTimer (EYTools)

+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(BKTimerBlock)block repeats:(BOOL)inRepeats {
	NSParameterAssert(block);
	return [self scheduledTimerWithTimeInterval: inTimeInterval target: self selector: @selector(bk_executeBlockFromTimer:) userInfo: [block copy] repeats: inRepeats];
}

+ (id)timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(BKTimerBlock)block repeats:(BOOL)inRepeats {
	NSParameterAssert(block);
	return [self timerWithTimeInterval: inTimeInterval target: self selector: @selector(bk_executeBlockFromTimer:) userInfo: [block copy] repeats: inRepeats];
}

+ (void)bk_executeBlockFromTimer:(NSTimer *)aTimer {
	BKTimerBlock block = [aTimer userInfo];
	if (block) block(aTimer);
}

@end
