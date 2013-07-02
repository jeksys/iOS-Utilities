//
//  Created by Evgeny Yagrushkin on 2013-07-01.
//  Copyright (c) 2013 Evgeny Yagrushkin. All rights reserved.
//

#import "UIViewController+EYTools.h"
#import "UIAlertView+BlockExtensions.h"

@implementation UIViewController (EYTools)

#pragma mark - messages

- (NSString*)stringForError:(NSError*)error{
    
    NSString *errorText = @"An Error Occurred";
    
    if (error) {
        if ([error.localizedRecoverySuggestion length] > 0) {
            NSError *jsonerror;
            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:[error.localizedRecoverySuggestion dataUsingEncoding:NSStringEncodingConversionAllowLossy] options:0 error:&jsonerror];
            if (jsonerror == nil) {
                if ([[[jsonDictionary valueForKey:@"status"] valueForKey:@"message"] length] > 0) {
                    errorText = [[jsonDictionary valueForKey:@"status"] valueForKey:@"message"];
                } else {
                    errorText = @"An Error Occurred";
                }
            } else {
                errorText = error.localizedRecoverySuggestion;
            }
        } else if ([error.localizedDescription length] > 0) {
            errorText = error.localizedDescription;
        } else {
            errorText = @"An Error Occurred";
        }
    }
    return errorText;
}

- (void) showError:(NSError*)error{
    
    if (error) {
        if ([error.localizedRecoverySuggestion length] > 0) {
            NSError *jsonerror;
            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:[error.localizedRecoverySuggestion dataUsingEncoding:NSStringEncodingConversionAllowLossy] options:0 error:&jsonerror];
            if (jsonerror == nil) {
                if ([[[jsonDictionary valueForKey:@"status"] valueForKey:@"message"] length] > 0) {
                    [self showErrorMessage:[[jsonDictionary valueForKey:@"status"] valueForKey:@"message"]];
                } else {
                    [self showErrorMessage:@"An Error Occurred"];
                }
            } else {
                [self showErrorMessage:error.localizedRecoverySuggestion];
            }
        } else if ([error.localizedDescription length] > 0) {
            [self showErrorMessage:error.localizedDescription];
        } else {
            [self showErrorMessage:@"An Error Occurred"];
        }
    }
    
}

- (void) showErrorMessage:(NSString*)errorMessage{
    UIAlertView  *errorAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:errorMessage delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
    
    //    Fixes crash by ensuring the action is on the main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        [errorAlert show];
    });
    
}

- (void) showWarningMessage:(NSString*)warningMessage{
    UIAlertView  *errorAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Warning", nil) message:warningMessage delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [errorAlert show];
    });
}

- (void) showMessage:(NSString*)message{
    UIAlertView  *errorAlert = [[UIAlertView alloc] initWithTitle:message message:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [errorAlert show];
    });
}

- (void) showMessage:(NSString*)message withTitle:(NSString*)title{
    UIAlertView  *errorAlert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [errorAlert show];
    });
}

- (void) showMessage:(NSString*)message withTitle:(NSString*)title withCompletion:(void (^)())completion{
    
    UIAlertView  *errorAlert = [[UIAlertView alloc] initWithTitle:title message:message completionBlock:^(NSUInteger buttonIndex, UIAlertView *alertView) {
        
        completion();
        
    } cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [errorAlert show];
    });
}



@end
