//
//  ViewController.m
//  CoreLocation
//
//  Created by Steven F Daniel on 23/10/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import "ViewController.h"
#import "MapViewAnnotation.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize mapView, curLat, curLong;

- (void)viewDidLoad {
    
    [super viewDidLoad];
		
	// Do any additional setup after loading the view, typically from a nib.
    foundLocation = NO;
    
    // Make this controller the delegate for the map view.
    self.mapView.delegate = self;
	
    // Ensure that you can view your own location in the map view.
    [self.mapView setShowsUserLocation:YES];
	
    // Instantiate a location object.
    locationManager = [[CLLocationManager alloc] init];
	
    // Make this controller the delegate for the location manager.
    [locationManager setDelegate:self];
	
    // Set some parameters for the location object.
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
	
    // Determine the current geographic location coordinates of the user on the map
    [locationManager startUpdatingLocation];
}

#pragma mark method is called when the view has been unloaded to release all objects.
- (void)viewDidUnload {
    
    [super viewDidUnload];
	
    // Release the memory by our IBOutlets and tell the MKMapView to stop updating location
    [self setMapView:nil];
    [locationManager stopUpdatingLocation];
}

#pragma mark Plots the geographic locations onto the Map
-(void)plotGeographicalData
{
	// Remove any existing custom annotations but not the user location blue dot.
    for (id <MKAnnotation> annotation in mapView.annotations) {
        if ([annotation isKindOfClass:[MapViewAnnotation class]]) {
            [mapView removeAnnotation:annotation];
        }
    }
	
	// Remove any existing overlays on our Map
	[self.mapView removeOverlays:[self.mapView overlays]];
	
	// Add the annotation to our map view
	NSString          *pinName;
	MapViewAnnotation *newAnnotation;
	
	pinName = @"Kuala Lumpur";
	newAnnotation = [[MapViewAnnotation alloc] initWithTitle:pinName
													subtitle:@"3.13900, 101.68685"
											   andCoordinate:CLLocationCoordinate2DMake(3.13900, 101.68685)];
	[self.mapView addAnnotation:newAnnotation];

	// Add the annotation to our map view
	pinName = @"Western Australia";
	newAnnotation = [[MapViewAnnotation alloc] initWithTitle:pinName
													subtitle:@"-31.93285, 115.86194"
											   andCoordinate:CLLocationCoordinate2DMake(-31.93285, 115.86194)];
	[self.mapView addAnnotation:newAnnotation];

	// Zoom in so that all pins fit within the map region
    [self zoomToFitMapAnnotations];
}

#pragma mark Reverse Geocoding location details
-(void)getGeocodingInformation
{
	// Declare the coordinates to reverse geocode
	CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
	CLLocationCoordinate2D placeCoord =  CLLocationCoordinate2DMake(3.13900, 101.68685);
	
	CLLocation *location = [[CLLocation alloc] initWithLatitude:placeCoord.latitude longitude:placeCoord.longitude];
	[geoCoder reverseGeocodeLocation:location completionHandler: ^(NSArray *placemarks, NSError *error) {
		// Get nearby address information
		CLPlacemark *placemark = [placemarks objectAtIndex:0];
		
		// Show the placemark information within an Alert dialog
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Placemark Information"
                                                        message:[placemark.addressDictionary description]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
		// Display the alert view dialog
        [alert show];
	}];
	
	return;
}

#pragma mark draws an overlay showing the current user location
-(void)createOverlayArea
{
	// Show the current user location with a 10,000 km radius
	MKCircle *circle = [MKCircle circleWithCenterCoordinate:mapView.userLocation.coordinate radius:100];
	circle.title = @"Current Location";
	[self.mapView addOverlay:circle];

	// Zoom into the current user's location using a 2 km span
	MKCoordinateRegion mapRegion;
    mapRegion.center = mapView.userLocation.coordinate;
	mapRegion.span = MKCoordinateSpanMake(0.2, 0.2);
    [mapView setRegion:mapRegion animated: YES];
}

-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id)overlay
{
    MKCircleView* circleView = [[MKCircleView alloc] initWithOverlay:overlay];
    circleView.strokeColor = [UIColor redColor];
    circleView.lineWidth = 1.0;
    circleView.fillColor = [UIColor colorWithRed:0.0 green:255.0 blue:0.0 alpha:0.1];
    return circleView;
}

#pragma mark sets up the properties for each of the annotations on the map
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    // Define the reuse identifier for the MapPoint Class.
    static NSString *identifier = @"MapViewAnnotation";
    
	// Place the current user location onto the Map at the location determined using the MKUserLocation class.
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.animatesDrop = NO;
        annotationView.pinColor = MKPinAnnotationColorGreen;
        return annotationView;
    }
    
    return nil;
}

#pragma mark Zooms in to the map so that all visible annotations are displayed
- (void)zoomToFitMapAnnotations {
    
    if ([self.mapView.annotations count] == 0) return;
    
    int i = 0;
    MKMapPoint points[[self.mapView.annotations count]];
    
    // Cycle through all annotations on the map and build array of annotation points
    for (id<MKAnnotation> annotation in [self.mapView annotations])
        points[i++] = MKMapPointForCoordinate(annotation.coordinate);
	
    // Create a rectangle view around the visible region that the user can move around in.
    MKPolygon *pv = [MKPolygon polygonWithPoints:points count:i];
    [self.mapView setRegion:MKCoordinateRegionForMapRect([pv boundingMapRect]) animated:YES];
}

#pragma mark Work out the current user location on the map 
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    // If this is the first launch of the app, then set the center point of the map to the user's location.
    if (!foundLocation)
    {
        // Determine the current geographic location coordinates
        self.curLat  = mapView.userLocation.coordinate.latitude;
        self.curLong = mapView.userLocation.coordinate.longitude;
		
		// Show the current user location within an Alert dialog
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You are located at"
                                                        message:[NSString stringWithFormat:@"Latitude: %f and Longitude: %f", self.curLat, self.curLong]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
		// Display the alert view dialog
        [alert show];
		
		// Call our function to plot the geographic positions on the map
		[self plotGeographicalData];
		[self createOverlayArea];
		
		// Reset so that this does not get called again.
        foundLocation = YES;
	}
}

#pragma mark If an error occurred, we need to tell our location Manager to stop updating location
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
	[locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Called when the user presses the Map Type button
- (IBAction)changeMapType:(id)sender{

    // Define an instance of our action sheet
    UIActionSheet *actionSheet;
    
    // Initialize our action sheet with the different mapping types
    actionSheet = [[UIActionSheet alloc]initWithTitle:@"Select a Map Type from the list below"
                                             delegate:self
                                    cancelButtonTitle:@"Cancel"
                               destructiveButtonTitle:@"Close"
                                    otherButtonTitles:@"Map View",@"Satellite View",@"Hybrid View", nil];
    
    // Set our Action Sheet style and then display it to the user
    actionSheet.actionSheetStyle =  UIBarStyleBlackTranslucent;
    [actionSheet showInView:self.view];
}

// Delegate that handles the chosen action sheet options
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // Determine the chosen item
    switch (buttonIndex) {
        case 1:  mapView.mapType = MKMapTypeStandard;  break;
        case 2:  mapView.mapType = MKMapTypeSatellite; break;
        case 3:  mapView.mapType = MKMapTypeHybrid;    break;
        default: break;  // Catch the Close button and exit.
    }
}
@end
