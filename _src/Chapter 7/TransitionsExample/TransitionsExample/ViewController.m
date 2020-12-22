//
//  ViewController.m
//  TransitionsExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Set up and initialize our ImageView Controller.
	self.imageView.image = [UIImage imageNamed:@"Prince_Frederick.jpg"];
	self.imageView.contentMode = UIViewContentModeScaleAspectFill;
}

#pragma mark method called when the user moves around the screen.
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	// Applies the Ripple Effect transition to the view.
	CATransition *animation = nil;
	animation = [CATransition animation];
	[animation setDelegate:self];
	[animation setDuration:3.0f];
	[animation setType:@"rippleEffect" ];
	[self.view.layer addAnimation:animation forKey:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
