//
//  ViewController.h
//  SocialNetworkApp
//
//  Created by Steven F. Daniel on 11/12/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController <UIActionSheetDelegate, FBRequestDelegate>
{
    AppDelegate               *mainDelegate;
    IBOutlet UIBarButtonItem  *loginButton;
    IBOutlet UIBarButtonItem  *postMessage;
    IBOutlet UIImageView      *imgPhoto;
    IBOutlet UITextView       *userInfoDetails;
    Facebook                  *facebook;
}

// Create the required class Setters and Getters
@property (nonatomic, strong) UIBarButtonItem  *loginButton;
@property (nonatomic, strong) UIBarButtonItem  *postMessage;
@property (nonatomic, strong) UIImageView      *imgPhoto;
@property (nonatomic, strong) UITextView       *userInfoDetails;
@property (nonatomic, retain) Facebook         *facebook;
@property (nonatomic, retain) AppDelegate      *mainDelegate;

// Declare our Instance methods
-(void)SendNotificationRequest;
-(void)PostMessagetoWall;
-(void)getGraphAPIData;

-(void)dialogDidComplete:(FBDialog *)dialog;
-(void)request:(FBRequest *)request didLoad:(id)result;
-(void)request:(FBRequest *)request didFailWithError:(NSError *)error;

@end