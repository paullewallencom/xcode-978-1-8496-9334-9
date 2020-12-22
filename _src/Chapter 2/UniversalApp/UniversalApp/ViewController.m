//
//  ViewController.m
//  UniversalApp
//
//  Created by Steven F Daniel on 19/09/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lblMessage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Do any additional setup after loading the view, typically from a nib.
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
		self.view.frame = CGRectMake(0, 0, 768, 1024);
		self.lblMessage.text = @"I'm running on the iPad";
		self.view.backgroundColor = [UIColor yellowColor];
		self.lblMessage.font = [UIFont systemFontOfSize:18.5f];
		self.lblMessage.adjustsFontSizeToFitWidth = TRUE;
	}
	else {
		self.lblMessage.text = @"I'm running on an iPhone";
		self.view.backgroundColor = [UIColor blueColor];
		self.lblMessage.font = [UIFont systemFontOfSize:18.5f];
		self.lblMessage.adjustsFontSizeToFitWidth = TRUE;
	}
}

- (void)viewDidUnload
{
	lblMessage = nil;
	[self setLblMessage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
