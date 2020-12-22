//
//  MapViewAnnotation.h
//  CoreLocation
//
//  Created by Steven F Daniel on 23/10/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapViewAnnotation : NSObject <MKAnnotation> {
	NSString *title;
	NSString *subtitle;
	CLLocationCoordinate2D coordinate;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithTitle:(NSString *)header subtitle:(NSString *)subtitle andCoordinate:(CLLocationCoordinate2D)coord2D;

@end

