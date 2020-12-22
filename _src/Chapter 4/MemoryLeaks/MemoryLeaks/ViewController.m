//
//  ViewController.m
//  MemoryLeaks
//
//  Created by Steven F Daniel on 13/10/12.
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
	NSLog(@"Starting....");
	
	// Loop for 5000 times
	for (int i = 1; i <= 5000; i++){
		NSString *status = [[NSString alloc]initWithString:@"Memory Leaking...."];
		NSLog(@"Value of i: - %i and status - %@", i, status);
	}
	
	NSLog(@"Completed..."); 
}

-(void)causeRuntimeError
{
   	NSLog(@"Runtime Error section started");
	
	NSMutableArray *myArray = [NSMutableArray array];
	for (int x = 0; x < 30; x++) {
		// Add the value to our Array
		[myArray addObject:[NSNumber numberWithInt:x]];
	}
	
	// This will cause a Runtime error, as we don't have any
	// item at this index within the array.
	@try {
		[myArray removeObjectAtIndex:30];
	}
	@catch (NSException *exception) {
		NSLog(@"Error: %@", exception);
	}
	@finally {
		NSLog(@"Runtime Error section completed.");
	}
}

-(void)causeCompiletimeError
{

	self.view.backgroundColor = [UIColor blueColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
