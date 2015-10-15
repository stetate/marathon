//
//  Marathon_FirstViewController.m
//  marathon
//
//  Created by Stephen Tate on 2013-04-21.
//  Copyright (c) 2013 Stephen Tate. All rights reserved.
//

#import "Marathon_FirstViewController.h"
#import "CoreLocationExampleAppDelegate.h"

@interface Marathon_FirstViewController ()

@end

@implementation Marathon_FirstViewController

@synthesize locationManager;
@synthesize lastKnownLocation;
@synthesize longitude, latitude;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setLocationManager:[[CLLocationManager alloc] init]];
    [locationManager setDelegate:self];
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    [locationManager startUpdatingLocation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark -
# pragma mark LocationGetter Delegate Methods
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    
    
    [latitude setText:[NSString stringWithFormat:@"%f", newLocation.coordinate.latitude]];
    
    [longitude setText:[NSString stringWithFormat:@"%f", newLocation.coordinate.longitude]];
}- (void)newPhysicalLocation:(CLLocation *)location {
    
    // Store for later use
    self.lastKnownLocation = location;
    
    // Alert user
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Found" message:[NSString stringWithFormat:@"Found physical location.  %f %f", self.lastKnownLocation.coordinate.latitude, self.lastKnownLocation.coordinate.longitude] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];

}

@end
