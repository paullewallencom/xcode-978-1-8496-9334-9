//
//  MapViewAnnotation.m
//  CoreLocation
//
//  Created by Steven F Daniel on 23/10/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "MapViewAnnotation.h"

@implementation MapViewAnnotation

@synthesize title, subtitle, coordinate;

-(id)initWithTitle:(NSString *)header subtitle:(NSString *)subtitles andCoordinate:(CLLocationCoordinate2D)coord2D
{
	title = header;
	subtitle = subtitles;
	coordinate = coord2D;
	return self;
}

@end
