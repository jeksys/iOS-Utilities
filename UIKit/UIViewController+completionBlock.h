//
//  UIViewController+completionBlock.h
//  Today's Parents
//
//  Created by Evgeny Yagrushkin on 12/9/2013.
//  Copyright (c) 2013 Rogers Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIViewController (completionBlock)

- (void) setCompletionBlock:(void(^)())completionBlock;

@end
