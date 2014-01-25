//
//  EYModalWebViewController.m
//

#import "EYModalWebViewController.h"

@interface EYModalWebViewController ()
{
    NSURLRequest *_URLRequest;
    UIBarButtonItem *_backButton;
    UIBarButtonItem *_forwardButton;
    UIActivityIndicatorView *_loadingView;
    UIAlertView *_noInternetConnectionAlertView;
}
@end

@implementation EYModalWebViewController

- (id)initWithURLRequest:(NSURLRequest *)request
{
    self = [super init];
    if (self) {
        _URLRequest = request;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Toolbar
    self.navigationController.toolbar.barTintColor = self.navigationController.navigationBar.barTintColor;
    [self.navigationController setToolbarHidden:NO animated:NO];
    [self.navigationController.toolbar setTranslucent:NO];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setFrame:CGRectMake(0, 0, 25, 25)];
    [back setImage:[UIImage imageNamed:@"BACK_IPHONE"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *forward = [UIButton buttonWithType:UIButtonTypeCustom];
    [forward setFrame:CGRectMake(0, 0, 25, 25)];
    [forward setImage:[UIImage imageNamed:@"NEXT_IPHONE"] forState:UIControlStateNormal];
    [forward addTarget:self action:@selector(forwardButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    _backButton     = [[UIBarButtonItem alloc] initWithCustomView:back];
    _forwardButton  = [[UIBarButtonItem alloc] initWithCustomView:forward];
    UIBarButtonItem *flexibleSpace  = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [_backButton setEnabled:NO];
    [_forwardButton setEnabled:NO];
    
    self.toolbarItems = @[_backButton, flexibleSpace, _forwardButton];
    
    // Close Button
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(closeButtonPressed)];
    [self.navigationItem setRightBarButtonItem:closeButton];
    
//    Reachability *reach = [Reachability reachabilityForInternetConnection];
//    if ([reach isReachable]) {
//        [self.webView loadRequest:_URLRequest];
//    } else {
//        if (!_noInternetConnectionAlertView) {
//            _noInternetConnectionAlertView = [[UIAlertView alloc] initWithTitle:nil message:@"You need an Internet connection to access this website." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        }
//        [_noInternetConnectionAlertView show];
//    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebView Delegate Methods
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (_loadingView != nil) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [_loadingView stopAnimating];
    }
    
    if ([self.webView canGoBack]) {
        [_backButton setEnabled:YES];
    } else {
        [_backButton setEnabled:NO];
    }
    
    if ([self.webView canGoForward]) {
        [_forwardButton setEnabled:YES];
    } else {
        [_forwardButton setEnabled:NO];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if (_loadingView != nil) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [_loadingView stopAnimating];
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (_loadingView == nil) {
        _loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_loadingView setHidesWhenStopped:YES];
        [_loadingView setCenter:CGPointMake(webView.bounds.size.width/2, webView.bounds.size.height/2 - 64)];
        
        [self.view addSubview:_loadingView];
    }
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    [_loadingView startAnimating];
    
    return YES;
}

#pragma mark - Back/Forward Button Methods
- (void)backButtonPressed
{
    [self.webView goBack];
}

- (void)forwardButtonPressed
{
    [self.webView goForward];
}

#pragma mark - Close Button Method
- (void)closeButtonPressed
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
