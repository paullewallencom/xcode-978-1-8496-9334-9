//
//  LinesCurvesView.m
//  LinesCurvesExample
//
//  Created by Steven F Daniel on 20/11/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "LinesCurvesView.h"

@implementation LinesCurvesView

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
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextClearRect(context, rect);
	
	// Draw our Line to our View
	CGContextSetLineWidth(context, 5);
	CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
	CGContextMoveToPoint(context, 0, 0);
	CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
	CGContextStrokePath(context);
	 
	// Then, draw and Add the Curve
	CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
	CGContextMoveToPoint(context, 0, self.bounds.size.height);
	CGContextAddCurveToPoint(context, 0, self.bounds.size.height, 5, self.bounds.size.height / 2, self.bounds.size.width, 0);
	CGContextStrokePath(context);
}

@end
