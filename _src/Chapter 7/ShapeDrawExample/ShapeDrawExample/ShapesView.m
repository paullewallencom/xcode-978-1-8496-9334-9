//
//  ShapesView.m
//  ShapeDrawExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ShapesView.h"

@implementation ShapesView

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
	
	// Draw our Circle to our view
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
	CGContextAddEllipseInRect(context, CGRectMake(50, 50, 150, 150));
	CGContextFillPath(context);
	
	// Draw Square to the Screen
	CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
	CGContextAddRect(context, CGRectMake(50, 200, 200, 200));
	CGContextFillPath(context);
	
	// Draw a Triangle to the Screen
    CGContextMoveToPoint   (context, 150, 100);  // Top    left
    CGContextAddLineToPoint(context, 300, 100);  // Middle right
    CGContextAddLineToPoint(context, 150, 300);  // Bottom left
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillPath(context);
}

@end
