//
//  DrawTextView.m
//  TextDrawExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "DrawTextView.h"

@implementation DrawTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	// Set up and initialise our Graphics Context
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextClearRect(context, rect);
	
	// Specify the text color and font fill style
	CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
	CGContextSetTextDrawingMode(context, kCGTextFillStroke);
	
	// Finally, draw the text using the specified font.
	NSString *theString = @"GENIESOFT STUDIOS...";
	[theString drawAtPoint:CGPointMake(20.0f, 100.0f) withFont:[UIFont fontWithName:@"Verdana-Bold" size:25]];
}

@end
