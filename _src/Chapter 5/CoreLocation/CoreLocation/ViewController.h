//
//  ViewController.h
//  CoreLocation
//
//  Created by Steven F Daniel on 23/10/12.
//  Copyright (c) 2012 GenieSoft Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <UIActionSheetDelegate, MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager        *locationManager;
	IBOutlet UIBarButtonItem *changeMap;
    BOOL                     foundLocation;
    
    // Obtain the user's current Longitude/Latitude
    float                  curLat;
    float                  curLong;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property float curLat;
@property float curLong;

// Declare our class instance methods
-(IBAction)changeMapType:(id)sender;

@end