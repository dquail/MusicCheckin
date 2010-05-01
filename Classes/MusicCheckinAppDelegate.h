//
//  MusicCheckinAppDelegate.h
//  MusicCheckin
//
//  Created by David Quail on 5/1/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MusicCheckinViewController;

@interface MusicCheckinAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MusicCheckinViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MusicCheckinViewController *viewController;

@end

