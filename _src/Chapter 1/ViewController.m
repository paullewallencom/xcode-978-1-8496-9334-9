//
//  ViewController.m
//  HelloWorld
//
//  Created by GENIESOFT-MBP02 on 22/08/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lblFirstname;
@synthesize txtFirstname;
@synthesize lblSurname;
@synthesize txtSurname;
@synthesize lblOutput;
@synthesize btnTapHere;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    lblFirstname = nil;
    txtFirstname = nil;
    lblSurname = nil;
    txtSurname = nil;
    lblOutput = nil;
    btnTapHere = nil;
    [self setLblFirstname:nil];
    [self setTxtFirstname:nil];
    [self setLblSurname:nil];
    [self setTxtSurname:nil];
    [self setLblOutput:nil];
    [self setBtnTapHere:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)btnTapHere:(id)sender {
    UIColor *color;
    int colorIndex;
    
    #ifdef DISPLAY_FIRSTNAME
        NSLog(@"Using the Firstname field.");
        NSString *greeting = [NSString stringWithFormat:
                              @"Welcome to Xcode 4 Cookbook series %@",
                              txtFirstname.text];
    #else
        NSLog(@"Using Firstname and Surname fields.");
        NSString *greeting = [NSString stringWithFormat:
                              @"Welcome to Xcode 4 Cookbook series %@ %@",
                              txtFirstname.text, txtSurname.text];
    #endif

    if (colorIndex == 1) {
        lblOutput.textColor = [UIColor redColor];
    }
    else if (colorIndex == 2) {
        lblOutput.textColor = [UIColor blueColor];        
    }
    else if (colorIndex == 2) {
        lblOutput.textColor = [UIColor purpleColor];
    }
    else {
        lblOutput.textColor = [UIColor blueColor];
    }
    
    lblOutput.text = greeting;
    lblOutput.font = [UIFont boldSystemFontOfSize:21];
}
@end
