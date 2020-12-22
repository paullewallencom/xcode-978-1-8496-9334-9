//
//  ViewController.m
//  ShakeExample
//
//  Created by Steven F Daniel on 19/09/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
	[self becomeFirstResponder];
    self.view.backgroundColor=[UIColor greenColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)canBecomeFirstResponder {
	
	return YES;
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	
	if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake)
    {
        self.view.backgroundColor=[UIColor yellowColor];
        NSLog(@"Device has been shaken");
    }
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
	
    if (event.type == UIEventTypeMotion && event.subtype == UIEventSubtypeMotionShake)
    {
        // Declare an instance of our Alert View dialog
        UIAlertView *dialog;
		
        // Initialise our Alert View Window with options
        dialog =[[UIAlertView alloc] initWithTitle:@"Device has been shaken"
										   message:@"I'm all shook up" delegate:self
								 cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
        
        // display our dialog and free the memory allocated by our dialog box
        [dialog show];
    }
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    self.view.backgroundColor=[UIColor blackColor];
	NSLog(@"Device shake has been cancelled");
}

// Responds to the options within our Alert View Dialog
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // String will be used to hold the text chosen for the button pressed.
    NSString *buttonTitle=[alertView buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"OK"])
	{
		self.view.backgroundColor=[UIColor greenColor];
		NSLog(@"Device has stopped shaking");
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
