//
//  NSTimer+EYTools.h
//  BreakfastTelevision
//
//  Created by Evgeny Yagrushkin on 2013-08-19.
//  Copyright (c) 2013 Rogers Media. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^BKTimerBlock)(NSTimer *timer);

@interface NSTimer (EYTools)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(BKTimerBlock)inBlock repeats:(BOOL)inRepeats;
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(BKTimerBlock)inBlock repeats:(BOOL)inRepeats;
@end
