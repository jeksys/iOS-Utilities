//
//  MFMailComposeViewController+block.m
//  Triggerfox
//
//  Created by Evgeny Yagrushkin 
//


#import "MFMailComposeViewController+block.h"
#import <objc/runtime.h>

@implementation MFMailComposeViewController (block)

- (void) setCompletionBlock:(void (^)(MFMailComposeViewController *controller, MFMailComposeResult result, NSError *error))block{
	objc_setAssociatedObject(self, "blockCallback", [block copy], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.mailComposeDelegate = self;
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    void (^block)(MFMailComposeViewController *controller, MFMailComposeResult result, NSError *error) = objc_getAssociatedObject(self, "blockCallback");
    if (block) {
        block(controller, result, error);
    }
}


@end
