//
//  ViewController.h
//  AccelGyroExample
//
//  Created by Steven F Daniel on 19/09/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController <UIAccelerometerDelegate> {
	CMMotionManager *motionManager;
}

@property (nonatomic, retain) CMMotionManager *motionManager;

@end