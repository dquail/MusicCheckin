//
//  WorldPlayingViewController.m
//  MusicCheckin
//
//  Created by David Quail on 5/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "WorldPlayingViewController.h"


@implementation WorldPlayingViewController
@synthesize webView;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: YES];
	NSString *url = [NSString stringWithFormat:@"http://www.playitloudr.com/iphone_top.html"];
	
	NSLog(@"Url loading from twitter: %@", url);
	NSMutableURLRequest *theRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
															cachePolicy:NSURLRequestUseProtocolCachePolicy
														timeoutInterval:10.0];
	
	[self.webView loadRequest:theRequest];	
	if (nil == alert) {
		alert = [[ActivityAlert alloc] initWithStatus: @"Loading Trends ..."];
	}
	[alert show];		
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];	
	[alert hide];
	[alert autorelease];
	alert = nil;
	
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)requestURL navigationType:(UIWebViewNavigationType)navigationType {	
	return YES;	
}



- (void)webViewDidFinishLoad:(UIWebView *)wv {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible: NO];	
	[alert hide];
	[alert autorelease];
	alert = nil;

	NSLog(@"Finished Loading twitter world request");
}


@end
