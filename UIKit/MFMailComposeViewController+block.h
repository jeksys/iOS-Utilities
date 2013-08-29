//
//  MFMailComposeViewController+block.h
//  Triggerfox
//
//  Created by Evgeny Yagrushkin
//

#import <MessageUI/MessageUI.h>

@interface MFMailComposeViewController (block) <MFMailComposeViewControllerDelegate>

- (void) setCompletionBlock:(void (^)(MFMailComposeViewController *controller, MFMailComposeResult result, NSError *error))block;

@end
