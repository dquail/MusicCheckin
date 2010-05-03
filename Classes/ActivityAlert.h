//
//  ActivityAlert.h
//

#import <UIKit/UIKit.h>

@interface ActivityAlert : NSObject <UIAlertViewDelegate> {
	UIAlertView *alert;
	UIActivityIndicatorView *activityView;
	UILabel *statusLabel;
}

@property (nonatomic, copy) NSString *statusText;

- (id) initWithStatus: (NSString *) statusText;

- (void) show;
- (void) hide;

@end
