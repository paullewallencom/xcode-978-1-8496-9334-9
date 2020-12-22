//
//  ViewController.m
//  TapExample
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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event   {
	UITouch *touch = [[event allTouches] anyObject];
    switch ([touch tapCount])
    {
        case 1:
            self.view.backgroundColor=[UIColor redColor];
            break;
        case 2:
            self.view.backgroundColor=[UIColor greenColor];
            break;
        case 3:
            self.view.backgroundColor=[UIColor blueColor];
            break;
        case 4:
            self.view.backgroundColor=[UIColor yellowColor];
            break;
        case 5:
            self.view.backgroundColor=[UIColor orangeColor];
            break;
        default:
            self.view.backgroundColor=[UIColor redColor];
            break;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
