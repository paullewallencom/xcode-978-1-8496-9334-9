//
//  SecondViewController.m
//  TwitterExample
//
///  Created by Steven F Daniel on 21/09/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	// Ensure we are processing the correct segue within the Storyboard
	if ([segue.identifier isEqualToString:@"firstViewController"])
	{
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Twitter Example"
															message:@"Currently displaying View #1"
														   delegate:self
												  cancelButtonTitle:@"OK"
												  otherButtonTitles:nil];
		[alertView show];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
