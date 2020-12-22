//
//  ViewController.m
//  AnimateViewExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize lblAnimateMsg;
@synthesize btnAnimate;

CGRect origPos;

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Set the colour of our Animation Label and disable button
	lblAnimateMsg.text = @"Animating Views Example";
	lblAnimateMsg.textColor = [UIColor yellowColor];
	[self.view setBackgroundColor:[UIColor blackColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Perform the animation of our Label
- (IBAction)doAnimation:(id)sender {

	// Save the original position of our Label
	origPos = lblAnimateMsg.frame;
	CGRect AnimateFrame = origPos;
	
	// Initialise and Specify the height of our frame
	AnimateFrame.size.height = 700;
	
	// Set the colour of our Animation Label and disable button
	lblAnimateMsg.text = @"Animating Views Example";
	lblAnimateMsg.textColor = [UIColor yellowColor];
	btnAnimate.enabled = NO;
	
	// Set up our Animations
	[UIView beginAnimations:@"AnimationBegin" context:nil];
	[UIView setAnimationDuration:5];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDidStopSelector:@selector(doAnimationStop)];
	
	// Increase the frame of our Animation message
	self.lblAnimateMsg.frame = AnimateFrame;
	[UIView commitAnimations];
}

#pragma mark Method is called when animation stops.
-(void)doAnimationStop
{
	lblAnimateMsg.frame = origPos;
	btnAnimate.enabled = YES;
	lblAnimateMsg.text = @"Animation has Completed.";
	lblAnimateMsg.textColor = [UIColor greenColor];
}
@end
