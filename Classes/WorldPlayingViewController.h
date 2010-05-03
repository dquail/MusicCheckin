//
//  WorldPlayingViewController.h
//  MusicCheckin
//
//  Created by David Quail on 5/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityAlert.h"

@interface WorldPlayingViewController : UIViewController <UIWebViewDelegate> {
	UIWebView *webView;
	ActivityAlert *alert;
}
@property (retain, nonatomic) IBOutlet UIWebView *webView;
@end
