//
//  Created by Evgeny Yagrushkin on 2013-07-01.
//  Copyright (c) 2013 Evgeny Yagrushkin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (EYTools)

- (void) showError:(NSError*)error;
- (void) showErrorMessage:(NSString*)errorMessage;
- (void) showWarningMessage:(NSString*)errorMessage;
- (void) showMessage:(NSString*)errorMessage;
- (void) showMessage:(NSString*)message withTitle:(NSString*)title;
- (void) showMessage:(NSString*)message withTitle:(NSString*)title withCompletion:(void (^)())completion;


@end
