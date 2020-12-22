//
//  ViewController.m
//  TextDrawExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"
#import "DrawTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Declare and add our custom view as a subView to the current view
	DrawTextView *drawTextView = [[DrawTextView alloc] initWithFrame:self.view.bounds];
	[self.view addSubview:drawTextView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
