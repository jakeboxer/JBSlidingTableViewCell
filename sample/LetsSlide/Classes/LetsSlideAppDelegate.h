//
//  LetsSlideAppDelegate.h
//  LetsSlide
//
//  Created by Jacob Boxer on 11/5/10.
//  Copyright 2010 jBoxer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LetsSlideViewController;

@interface LetsSlideAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LetsSlideViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LetsSlideViewController *viewController;

@end

