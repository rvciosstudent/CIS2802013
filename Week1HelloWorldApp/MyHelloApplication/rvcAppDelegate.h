//
//  rvcAppDelegate.h
//  MyHelloApplication
//
//  Created by Charles Konkol on 1/7/13.
//  Copyright (c) 2013 Charles Konkol. All rights reserved.
//

#import <UIKit/UIKit.h>

@class rvcViewController;

@interface rvcAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) rvcViewController *viewController;

@end
