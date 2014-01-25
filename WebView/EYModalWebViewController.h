//
//  EYModalWebViewController.h
//

#import <UIKit/UIKit.h>

@interface EYModalWebViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

- (id)initWithURLRequest:(NSURLRequest *)request;

@end
