//
//  Marathon_FirstViewController.m
//  marathon
//
//  Created by Stephen Tate on 2013-04-21.
//  Copyright (c) 2013 Stephen Tate. All rights reserved.
//

#import "Marathon_FirstViewController.h"
#import "CoreLocationExampleAppDelegate.h"
#import "Marathon_mapViewViewController.h"

@interface Marathon_FirstViewController ()

@end

@implementation Marathon_FirstViewController

@synthesize locationManager;
@synthesize lastKnownLocation;
@synthesize longitude, latitude;
@synthesize instantMap;


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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"preparing to switch to mapview %@", segue.identifier);
    if([segue.identifier isEqualToString:@"mapViewShow"])
    {
        [segue.destinationViewController setLocation:self.lastKnownLocation];
        
        NSLog(@"%@",segue.destinationViewController);

        //[controller setLocation:self.lastKnownLocation];
        
        NSLog(@"this is what i am sent over lat = %f long= %f", lastKnownLocation.coordinate.longitude, lastKnownLocation.coordinate.latitude);
        
        
        
    }
    
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
    
    lastKnownLocation = newLocation;
    
    /// location logging
    ///NSLog(@"%@", newLocation);
    
    [latitude setText:[NSString stringWithFormat:@"%f", newLocation.coordinate.latitude]];
    
    [longitude setText:[NSString stringWithFormat:@"%f", newLocation.coordinate.longitude]];
    
    [self.instantMap setRegion:MKCoordinateRegionMakeWithDistance(self.lastKnownLocation.coordinate, 1000, 1000)];
    [self.instantMap setCenterCoordinate:[self.lastKnownLocation coordinate] animated:TRUE];
    
}


- (void)newPhysicalLocation:(CLLocation *)location {
    
    // Store for later use
    self.lastKnownLocation = location;
    
    // Alert user
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Found" message:[NSString stringWithFormat:@"Found physical location.  %f %f", self.lastKnownLocation.coordinate.latitude, self.lastKnownLocation.coordinate.longitude] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];

}

@end
