//
//  ViewController.m
//  ShapeDrawExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"
#import "ShapesView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Declare and add our custom view as a subView to the current view
	ShapesView *shapesView = [[ShapesView alloc] initWithFrame:self.view.bounds];
	[self.view addSubview:shapesView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
