//
//  AppDelegate.h
//  SocialNetworkApp
//
//  Created by Steven F. Daniel on 11/12/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBConnect.h"

@class ViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate, FBSessionDelegate, FBDialogDelegate>
{
    Facebook *facebook;
}

// Create the required class Setters and Getters
@property (strong, nonatomic) UIWindow       *window;
@property (strong, nonatomic) ViewController *viewController;
@property (nonatomic, retain) Facebook       *facebook;

-(void)fbDidLogin;
-(void)fbDidLogout;
-(void)fbSessionInvalidated;

@end
