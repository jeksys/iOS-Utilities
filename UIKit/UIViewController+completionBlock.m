//
//  UIViewController+completionBlock.m
//  Today's Parents
//
//  Created by Evgeny Yagrushkin on 12/9/2013.
//  Copyright (c) 2013 Rogers Media. All rights reserved.
//

#import "UIViewController+completionBlock.h"

@implementation UIViewController (completionBlock)

- (void) setCompletionBlock:(void(^)())completionBlock{
    objc_setAssociatedObject(self, "completionBlock", [completionBlock copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
